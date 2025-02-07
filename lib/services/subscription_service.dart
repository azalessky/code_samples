import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rustore_billing/flutter_rustore_billing.dart';
import 'package:flutter_rustore_billing/pigeons/rustore.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/helpers/helpers.dart';

class SubscriptionStatus {
  final bool active;
  final bool recurrent;
  final DateTime expiration;

  SubscriptionStatus({
    required this.active,
    required this.recurrent,
    required this.expiration,
  });
}

enum SubscriptionError {
  storeNotInstalled,
  userNotAuthorized,
  purchaseCancelled,
}

class SubscriptionException implements Exception {
  final SubscriptionError? code;
  final String? message;

  const SubscriptionException({this.code, this.message});

  factory SubscriptionException.fromException(Exception e) {
    if (e is PlatformException) {
      final details = e.details as String? ?? '';
      late SubscriptionError? code;

      if (details.contains('RuStoreUserUnauthorizedException')) {
        code = SubscriptionError.userNotAuthorized;
      } else if (details.contains('Cancelled')) {
        code = SubscriptionError.purchaseCancelled;
      } else {
        code = null;
      }
      return SubscriptionException(code: code, message: e.message);
    } else {
      return SubscriptionException(message: e.toString());
    }
  }

  @override
  String toString() => '$code: $message';
}

class SubscriptionService {
  Future<void> checkStore() async {
    bool result = await RustoreBillingClient.isRustoreInstalled();
    if (!result) {
      throw SubscriptionException(code: SubscriptionError.storeNotInstalled);
    }
  }

  Future<Map<String, String>> getPrices(List<String> productIds) async {
    return await _handleException(() async {
      final response = await RustoreBillingClient.products(productIds);
      final products = response.products..sort((a, b) => a!.price!.compareTo(b!.price!));

      final Map<String, String> prices = {};
      for (final product in products) {
        final price = product!.priceLabel!.replaceAll('.00', '');
        prices[product.productId] = price;
      }
      return prices;
    });
  }

  Future<SuccessPurchase?> purchaseProduct(String productId) async {
    return await _handleException(() async {
      final result = await RustoreBillingClient.purchase(productId, null);
      return result.successPurchase;
    });
  }

  Future<SubscriptionStatus?> getStatus(String productId, String token) async {
    if (token.isEmpty) return null;

    final timestamp = DateTime.timestamp().toIso8601String();
    final signature = await CryptoHelper.rsa512Signature(
      RustoreSettings.keyId + timestamp,
      RustoreSettings.privateKey,
    );

    try {
      final jwe = await _getJweToken(RustoreSettings.keyId, signature, timestamp);
      if (jwe == null) return null;

      final status = _getStatus(jwe, productId, token);
      return status;
    } on Exception {
      return null;
    }
  }

  Future<dynamic> _handleException(Future<dynamic> Function() action) async {
    try {
      return await action();
    } on Exception catch (e) {
      throw SubscriptionException.fromException(e);
    }
  }

  Future<String?> _getJweToken(String keyId, String signature, String timestamp) async {
    final url = Uri.parse(RustoreSettings.authUrl);
    final headers = {'Content-Type': 'application/json'};
    final payload = {'keyId': keyId, 'timestamp': timestamp, 'signature': signature};
    final body = jsonEncode(payload);

    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode != 200) return null;

    final data = json.decode(response.body);
    return data['body']?['jwe'];
  }

  Future<SubscriptionStatus?> _getStatus(String jwe, String productId, String token) async {
    final uri = '${RustoreSettings.subscriptionUrl}/${AppSettings.packageName}/$productId/$token';
    final url = Uri.parse(uri);
    final headers = {'Public-Token': jwe};

    final response = await http.get(url, headers: headers);
    if (response.statusCode != 200) return null;

    final body = jsonDecode(response.body);
    final recurrent = body['autoRenewing'] == true;
    final expiration = DateTime.fromMillisecondsSinceEpoch(int.parse(body['expiryTimeMillis']));
    final active = body['paymentState'] == 1 && expiration.isAfter(DateTime.now());

    return SubscriptionStatus(
      active: active,
      recurrent: recurrent,
      expiration: expiration,
    );
  }
}

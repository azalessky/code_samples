import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

part 'subscription.freezed.dart';
part 'subscription.g.dart';

@freezed
class Subscription with _$Subscription implements Serializable {
  const Subscription._();

  const factory Subscription({
    required String id,
    required DateTime expiration,
    required bool active,
    required bool recurrent,
    required String product,
    required String purchase,
    required String token,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);

  factory Subscription.empty() => Subscription(
        id: ObjectId().value,
        expiration: DateTime.now().add(AppSettings.trialPeriod),
        active: false,
        recurrent: false,
        product: '',
        purchase: '',
        token: '',
      );

  bool get isTrial => product.isEmpty;
  bool get isPaid => product.isNotEmpty;
  bool get isExpired => expiration.isBefore(DateTime.now());
  int get daysLeft => expiration.difference(DateTime.now()).inDays;
}

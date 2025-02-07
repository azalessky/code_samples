import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_planner/services/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/features/shared/shared.dart';

class SubscriptionManager {
  late AppLifecycleListener appListener;
  void Function()? listenerTask;

  SubscriptionManager() {
    appListener = AppLifecycleListener(
      onResume: () {
        listenerTask?.call();
        listenerTask = null;
      },
    );
  }

  Future<void> purchase(String productId, Subscriptions notifier) async {
    try {
      if (!authService.isSignedIn) {
        final result = await authService.signIn();
        if (!result) return;
      }

      final result = await subscriptionService.purchaseProduct(productId);
      final token = result?.subscriptionToken;
      if (result == null || token == null) return;

      final status = await subscriptionService.getStatus(productId, token);
      if (status != null) {
        notifier.expiration = status.expiration;
        notifier.active = status.active;
        notifier.recurrent = status.recurrent;
      }
      notifier.product = productId;
      notifier.purchase = result.purchaseId;
      notifier.token = token;

      await cachedRepository.saveData();
    } on SubscriptionException catch (e) {
      if (e.code == SubscriptionError.purchaseCancelled ||
          e.code == SubscriptionError.userNotAuthorized) {
        return;
      }
      showSnackBar(SnackBarStyle.error, 'Message.ErrorOccuried'.tr());
    }
  }

  Future<void> manage(Subscription subscription, Subscriptions notifier) async {
    try {
      final url = Uri.parse(RustoreSettings.storeDeepLink);
      await launchUrl(url, mode: LaunchMode.externalNonBrowserApplication);
      listenerTask = () => update(subscription, notifier);
    } on Exception {
      showSnackBar(SnackBarStyle.error, 'Message.ErrorOccuried'.tr());
    }
  }

  Future<void> update(Subscription subscription, Subscriptions notifier) async {
    final status = await subscriptionService.getStatus(subscription.product, subscription.token);
    if (status == null) return;

    notifier.expiration = status.expiration;
    notifier.active = status.active;
    notifier.recurrent = status.recurrent;

    await cachedRepository.saveData();
  }

  bool check(BuildContext context, Subscription subscription) {
    if (Platform.isIOS) return true;

    if (subscription.isPaid) {
      if (subscription.active) return true;
      _promptSubscribe(context);
      return false;
    }
    if (subscription.isTrial) {
      if (!subscription.isExpired) return true;
      _promptSubscribe(context);
      return false;
    }
    return false;
  }

  void _promptSubscribe(BuildContext context) {
    showPromptDialog(
      context: context,
      title: 'Prompt.Subscription'.tr(),
      text: 'Prompt.SubscriptionExpired'.tr(),
      onConfirmed: () => context.pushRoute(SubscriptionsRoute()),
    );
  }
}

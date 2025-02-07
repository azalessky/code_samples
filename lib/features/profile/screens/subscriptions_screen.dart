import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/features/shared/shared.dart';
import 'package:student_planner/services/services.dart';

@RoutePage()
class SubscriptionsScreen extends ConsumerStatefulWidget {
  const SubscriptionsScreen({super.key});

  @override
  ConsumerState<SubscriptionsScreen> createState() => _SubscriptionsScreenState();
}

class _SubscriptionsScreenState extends ConsumerState<SubscriptionsScreen> {
  @override
  Widget build(BuildContext context) {
    logEvent(AnalyticsEvent.subscriptionsShowList);

    final subscription = ref.watch(subscriptionsProvider);
    final notifier = ref.read(subscriptionsProvider.notifier);

    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SubscriptionsScreen.Title'.tr()),
      ),
      body: FutureBuilder(
        future: _getData(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return _buildProductList(snapshot.data!, subscription, notifier);
          } else if (snapshot.hasError) {
            return _buildErrorDetails(snapshot.error, snapshot.stackTrace);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<Map<String, String>> _getData() async {
    await subscriptionService.checkStore();
    return subscriptionService.getPrices(RustoreSettings.products);
  }

  Widget _buildProductList(
    Map<String, String> prices,
    Subscription subscription,
    Subscriptions notifier,
  ) {
    return ConstrainedColumn(
      children: [
        ...prices.entries.map((entry) => _buildProductTile(
              entry.key,
              entry.value,
              subscription,
              notifier,
            )),
        ...subscription.active ? _buildBottomSection(subscription, notifier) : [],
      ],
    );
  }

  Widget _buildProductTile(
    String productId,
    String price,
    Subscription subscription,
    Subscriptions notifier,
  ) {
    final icons = {
      'subscription_month': Symbols.coffee,
      'subscription_year': Symbols.cake,
      'subscription_lifetime': Symbols.celebration,
    };
    final titles = {
      'subscription_month': 'Period.Month'.tr(),
      'subscription_year': 'Period.Year'.tr(),
      'subscription_lifetime': 'Period.Lifetime'.tr(),
    };
    final bool selected = subscription.active && subscription.product == productId;

    return ListTile(
      leading: Icon(icons[productId]),
      title: Text(titles[productId] ?? ''),
      subtitle: Text(price),
      trailing: selected ? Icon(Symbols.check) : null,
      onTap: () {
        logEvent(AnalyticsEvent.subscriptionsPurchase);
        subscriptionManager.purchase(productId, notifier);
      },
    );
  }

  Widget _buildErrorDetails(Object? error, StackTrace? stackTrace) {
    late String text;
    if (error is SubscriptionException) {
      text = switch (error.code) {
        SubscriptionError.storeNotInstalled => 'Error.Store'.tr(),
        SubscriptionError.userNotAuthorized => 'Error.User'.tr(),
        _ => 'Error.Server'.tr(),
      };
    } else {
      text = 'Error.Unknown'.tr();
    }
    return SpacePlaceholder(text: text);
  }

  List<Widget> _buildBottomSection(Subscription subscription, Subscriptions notifier) {
    return [
      Spacer(),
      TextButton.icon(
        label: Text(
          subscription.recurrent
              ? 'SubscriptionsScreen.CancelSubscription'.tr()
              : 'SubscriptionsScreen.ResumeSubscription'.tr(),
        ),
        icon: Icon(
          subscription.recurrent ? Icons.cancel_outlined : Icons.autorenew_outlined,
        ),
        onPressed: () {
          logEvent(subscription.recurrent
              ? AnalyticsEvent.subscriptionsCancel
              : AnalyticsEvent.subscriptionsResume);
          subscriptionManager.manage(subscription, notifier);
        },
      ),
      FormLayout.sectionSpacer,
    ];
  }
}

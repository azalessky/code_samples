import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

class SubscriptionTile extends StatelessWidget {
  final Subscription subscription;

  const SubscriptionTile({
    required this.subscription,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(subscription.isTrial ? Symbols.timer : Symbols.diamond),
      title: _buildTitle(context),
      subtitle: _buildSubtitle(context),
      trailing: const Icon(Symbols.chevron_right),
      onTap: () => context.pushRoute(const SubscriptionsRoute()),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      subscription.isPaid ? 'Subscription.Paid'.tr() : 'Subscription.Trial'.tr(),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    final titles = {
      'test18': 'Ежемесячная подписка',
      'subscription_month': 'Subscription.Month'.tr(),
      'subscription_year': 'Subscription.Year'.tr(),
      'subscription_lifetime': 'Subscription.Lifetime'.tr(),
    };

    return Text(
      subscription.isPaid
          ? subscription.isExpired
              ? 'Subscription.Expired'.tr()
              : subscription.recurrent
                  ? titles[subscription.product] ?? subscription.product
                  : subscription.active
                      ? 'Subscription.Expires'
                          .tr(args: [DateFormat.yMd().format(subscription.expiration)])
                      : 'Subscription.Required'.tr()
          : subscription.isExpired
              ? 'Subscription.Required'.tr()
              : 'Subscription.Remaining'.plural(subscription.daysLeft),
    );
  }
}

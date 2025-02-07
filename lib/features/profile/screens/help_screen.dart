import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:in_app_review/in_app_review.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/features/shared/shared.dart';

@RoutePage()
class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('HelpScreen.Title'.tr()),
      ),
      body: FutureBuilder(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) =>
            snapshot.hasData ? _buildBody(context, snapshot.data!) : Container(),
      ),
    );
  }

  Widget _buildBody(BuildContext context, PackageInfo info) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FormLayout.largeSpacer,
          Image.asset(ResourceSettings.androidIcon, width: 64, height: 64),
          FormLayout.fieldSpacer,
          context.titleMedium(info.appName),
          FormLayout.mediumSpacer,
          context.textMedium(
            'HelpScreen.VersionText'.tr(args: [
              info.version.toString(),
              info.buildNumber.toString(),
            ]),
          ),
          FormLayout.fieldSpacer,
          const Divider(),
          ListTile(
            leading: const Icon(Symbols.share),
            title: Text('HelpScreen.ShareApp'.tr()),
            onTap: () => Share.share(
              Platform.isIOS ? AppSettings.iOSAppUrl : AppSettings.androidAppUrl,
            ),
          ),
          ListTile(
            leading: const Icon(Symbols.star),
            title: Text('HelpScreen.RateApp'.tr()),
            onTap: () => _rateAppHandler(context),
          ),
          ListTile(
            leading: const Icon(Symbols.email),
            title: Text('HelpScreen.ContactDev'.tr()),
            onTap: () => launchUrl(
              Uri.parse('${AppSettings.supportEmail}%20${info.version}'),
              mode: LaunchMode.externalNonBrowserApplication,
            ),
          ),
        ],
      ),
    );
  }

  void _rateAppHandler(BuildContext context) async {
    try {
      if (Platform.isIOS) {
        await InAppReview.instance.requestReview();
      } else {
        await launchUrl(
          Uri.parse(AppSettings.androidAppUrl),
          mode: LaunchMode.externalNonBrowserApplication,
        );
      }
    } catch (_) {
      showSnackBar(SnackBarStyle.error, 'HelpScreen.RateAppError'.tr());
    }
  }
}

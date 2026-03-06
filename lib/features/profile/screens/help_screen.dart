import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(t.helpScreen.title),
      ),
      body: ConstrainedColumn(
        children: [
          FormLayout.largeSpacer,
          _buildPackageInfo(context),
          FormLayout.fieldSpacer,
          const Divider(),
          _buildShareApp(),
          _buildRateApp(),
          _buildContactDev(),
          Spacer(),
          _buildDeleteProfile(context),
          FormLayout.bottomSpacer,
        ],
      ),
    );
  }

  Widget _buildPackageInfo(BuildContext context) {
    return Column(
      children: [
        AppIcon(size: 64),
        FormLayout.fieldSpacer,
        context.titleMedium(packageInfo.appName),
        FormLayout.mediumSpacer,
        context.textMedium(
          t.helpScreen.versionText(
            version: packageInfo.version.toString(),
            build: packageInfo.buildNumber.toString(),
          ),
        ),
      ],
    );
  }

  Widget _buildShareApp() {
    return ListTile(
      leading: const Icon(Symbols.share),
      title: Text(t.helpScreen.shareApp),
      onTap: () => SharePlus.instance.share(
        ShareParams(text: StoreHelper.shareLink),
      ),
    );
  }

  Widget _buildRateApp() {
    return ListTile(
      leading: const Icon(Symbols.star),
      title: Text(t.helpScreen.rateApp),
      onTap: () => _openUrl(StoreHelper.directLink),
    );
  }

  Widget _buildContactDev() {
    return ListTile(
      leading: const Icon(Symbols.email),
      title: Text(t.helpScreen.contactDev),
      onTap: () => _contactDev(),
    );
  }

  Widget _buildDeleteProfile(BuildContext context) {
    return TextButton.icon(
      label: Text(t.helpScreen.deleteProfile),
      icon: Icon(Symbols.delete),
      onPressed: () => showPromptDialog(
        title: t.prompt.titleConfirmation,
        text: t.prompt.deleteProfile,
        onConfirmed: () => _deleteProfile(context),
      ),
    );
  }

  Future<void> _deleteProfile(BuildContext context) async {
    logEvent(AnalyticsEvent.userDeleteProfile);
    await profileManager.deleteData(true);
  }

  Future<void> _contactDev() async {
    await _openUrl('${AppSettings.supportEmail}%20${packageInfo.version}');
  }

  Future<void> _openUrl(String url) async {
    try {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      messages.showMessage(UserMessage.errorOccurred);
    }
  }
}

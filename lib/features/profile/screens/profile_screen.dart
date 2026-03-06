import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/features/profile/profile.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountsProvider);

    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(t.profileScreen.title),
        actions: [
          if (account.email.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => _signOutUser(context, account.email),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildAccount(context, account),
            const Divider(),
            _buildSubjects(context),
            _buildTeachers(context),
            _buildTerms(context),
            _buildLabels(context),
            const Divider(),
            _buildSettings(context),
            _buildAbout(context),
            if (!AppSettings.isProduction) UserDebugInfo(account: account),
          ],
        ),
      ),
    );
  }

  Widget _buildAccount(BuildContext context, Account account) {
    return AccountSection(
      account: account,
      signInTitle: t.profileScreen.signInButton,
      welcomeText: (name) => t.profileScreen.welcomeText(name: name),
      onSignIn: () => _signInUser(),
    );
  }

  Widget _buildSubjects(BuildContext context) {
    return ListTile(
      leading: const Icon(Symbols.science),
      title: Text(t.profileScreen.subjects),
      trailing: const Icon(Symbols.chevron_right),
      onTap: () => context.pushRoute(const SubjectsRoute()),
    );
  }

  Widget _buildTeachers(BuildContext context) {
    return ListTile(
      leading: const Icon(Symbols.school),
      title: Text(t.profileScreen.teachers),
      trailing: const Icon(Symbols.chevron_right),
      onTap: () => context.pushRoute(const TeachersRoute()),
    );
  }

  Widget _buildTerms(BuildContext context) {
    return ListTile(
      leading: const Icon(Symbols.date_range),
      title: Text(t.profileScreen.terms),
      trailing: const Icon(Symbols.chevron_right),
      onTap: () => context.pushRoute(const TermsRoute()),
    );
  }

  Widget _buildLabels(BuildContext context) {
    return ListTile(
      leading: const Icon(Symbols.label),
      title: Text(t.profileScreen.labels),
      trailing: const Icon(Symbols.chevron_right),
      onTap: () => context.pushRoute(const LabelsRoute()),
    );
  }

  Widget _buildSettings(BuildContext context) {
    return ListTile(
      leading: const Icon(Symbols.settings),
      title: Text(t.profileScreen.settings),
      trailing: const Icon(Symbols.chevron_right),
      onTap: () => context.pushRoute(const SettingsRoute()),
    );
  }

  Widget _buildAbout(BuildContext context) {
    return ListTile(
      leading: const Icon(Symbols.help),
      title: Text(t.profileScreen.about),
      trailing: const Icon(Symbols.chevron_right),
      onTap: () => context.pushRoute(const HelpRoute()),
    );
  }

  Future<void> _signInUser() async {
    logEvent(AnalyticsEvent.userSignIn);

    if (await profileManager.signInUser()) {
      await profileManager.syncData();
    }
  }

  Future<void> _signOutUser(BuildContext context, String email) async {
    logEvent(AnalyticsEvent.userSignOut);

    await showPromptDialog(
      title: email,
      text: t.prompt.signOut,
      onConfirmed: () => profileManager.signOutUser(),
    );
  }
}

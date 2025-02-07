import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/features/profile/profile.dart';
import 'package:student_planner/features/shared/shared.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final account = ref.watch(accountsProvider);

    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ProfileScreen.Title'.tr()),
        actions: [
          if (account.isSignedIn)
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => _signOutUser(account.email),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildAccount(),
            const Divider(),
            _buildSubjects(),
            _buildTeachers(),
            _buildTerms(),
            _buildSettings(),
            _buildAbout(),
          ],
        ),
      ),
    );
  }

  Widget _buildAccount() {
    return AccountSection(
      signInText: 'ProfileScreen.SignInButton'.tr(),
      welcomeText: 'ProfileScreen.WelcomeText'.tr(),
      onSignIn: () => _signInUser(),
    );
  }

  Widget _buildSubjects() {
    return ListTile(
      leading: const Icon(Symbols.science),
      title: Text('ProfileScreen.Subjects'.tr()),
      trailing: const Icon(Symbols.chevron_right),
      onTap: () => context.pushRoute(const SubjectsRoute()),
    );
  }

  Widget _buildTeachers() {
    return ListTile(
      leading: const Icon(Symbols.school),
      title: Text('ProfileScreen.Teachers'.tr()),
      trailing: const Icon(Symbols.chevron_right),
      onTap: () => context.pushRoute(const TeachersRoute()),
    );
  }

  Widget _buildTerms() {
    return ListTile(
      leading: const Icon(Symbols.date_range),
      title: Text('ProfileScreen.Terms'.tr()),
      trailing: const Icon(Symbols.chevron_right),
      onTap: () => context.pushRoute(const TermsRoute()),
    );
  }

  Widget _buildSettings() {
    return ListTile(
      leading: const Icon(Symbols.settings),
      title: Text('ProfileScreen.Settings'.tr()),
      trailing: const Icon(Symbols.chevron_right),
      onTap: () => context.pushRoute(const SettingsRoute()),
    );
  }

  Widget _buildAbout() {
    return ListTile(
      leading: const Icon(Symbols.help),
      title: Text('ProfileScreen.About'.tr()),
      trailing: const Icon(Symbols.chevron_right),
      onTap: () => context.pushRoute(const HelpRoute()),
    );
  }

  Future<void> _signInUser() async {
    logEvent(AnalyticsEvent.userSignIn);
    await profileManager.signInUser();
  }

  Future<void> _signOutUser(String email) async {
    logEvent(AnalyticsEvent.userSignOut);
    await showPromptDialog(
      context: context,
      title: email,
      text: 'Prompt.SignOut'.tr(),
      onConfirmed: () => profileManager.signOutUser(context),
    );
  }
}

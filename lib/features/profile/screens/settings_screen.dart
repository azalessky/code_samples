import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(t.settingsScreen.title),
      ),
      body: ConstrainedColumn(
        children: [
          _buildListTile(
            Symbols.settings,
            t.settingsScreen.general,
            () => context.pushRoute(const GeneralSettingsRoute()),
          ),
          _buildListTile(
            Symbols.discover_tune,
            t.settingsScreen.advanced,
            () => context.pushRoute(const AdvancedSettingsRoute()),
          ),
          _buildListTile(
            Symbols.notifications,
            t.settingsScreen.reminders,
            () => context.pushRoute(const RemindersSettingsRoute()),
          ),
          _buildListTile(
            Symbols.calendar_today,
            t.settingsScreen.schedule,
            () => context.pushRoute(const ScheduleSettingsRoute()),
          ),
          _buildListTile(
            Symbols.leaderboard,
            t.settingsScreen.grades,
            () => context.pushRoute(const GradesSettingsRoute()),
          ),
          Spacer(),
          _buildImportantButton(context),
          FormLayout.bottomSpacer,
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Symbols.chevron_right),
      onTap: onTap,
    );
  }

  Widget _buildImportantButton(BuildContext context) {
    return TextButton.icon(
      label: Text(t.settingsScreen.importantButton),
      icon: Icon(Symbols.help),
      onPressed: () => showModalDialog(
        builder: (_) => MessageDialog(
          title: t.settingsScreen.importantTitle,
          text: t.settingsScreen.importantText,
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/features/profile/profile.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class RemindersSettingsScreen extends ConsumerWidget {
  const RemindersSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(settingsProvider.select((c) => c.reminders));

    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(t.remindersSettingsScreen.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildLessonStart(ref, config),
            _buildUpcomingAssignments(context, ref, config),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonStart(WidgetRef ref, RemindersConfig config) {
    final time = config.lessonStart.value.tr();
    final text = config.lessonStart.enabled
        ? t.remindersSettingsScreen.lessonStartText(time: time)
        : t.remindersSettingsScreen.lessonStartDisabled;

    return ToggleListTile(
      initialValue: config.lessonStart.enabled,
      leading: const Icon(Symbols.timer),
      title: t.remindersSettingsScreen.lessonStart,
      subtitle: text,
      onTap: () => showModalDialog<ReminderTime>(
        builder: (_) => ValueListDialog(
          title: t.remindersSettingsScreen.lessonStart,
          values: ReminderTime.values,
          initialValue: config.lessonStart.enabled ? config.lessonStart.value : null,
          textBuilder: (value) => value.tr(),
        ),
        onSaved: (value) => _updateConfig(
          ref,
          config.withLessonStart(enabled: true, value: value),
        ),
      ),
      onToggle: () => _updateConfig(
        ref,
        config.withLessonStart(enabled: !config.lessonStart.enabled),
      ),
    );
  }

  Widget _buildUpcomingAssignments(BuildContext context, WidgetRef ref, RemindersConfig config) {
    final time = config.upcomingAssignments.value.format(context);
    final text = config.upcomingAssignments.enabled
        ? t.remindersSettingsScreen.upcomingAssignmentsText(time: time)
        : t.remindersSettingsScreen.upcomingAssignmentsDisabled;

    return ToggleListTile(
      initialValue: config.upcomingAssignments.enabled,
      leading: const Icon(Symbols.event_upcoming),
      title: t.remindersSettingsScreen.upcomingAssignments,
      subtitle: text,
      onTap: () async {
        final value = await showTimePicker(
          context: context,
          initialTime: config.upcomingAssignments.value,
        );
        if (value != null) {
          _updateConfig(
            ref,
            config.withUpcomingAssignments(enabled: true, value: value),
          );
        }
      },
      onToggle: () => _updateConfig(
        ref,
        config.withUpcomingAssignments(enabled: !config.upcomingAssignments.enabled),
      ),
    );
  }

  void _updateConfig(WidgetRef ref, RemindersConfig value) {
    logEvent(AnalyticsEvent.settingsUpdate);

    ref.read(settingsProvider.notifier).reminders = value;
    ref.read(settingsProvider.notifier).save();
  }
}

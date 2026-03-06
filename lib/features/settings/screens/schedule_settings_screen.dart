import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class ScheduleSettingsScreen extends ConsumerWidget {
  const ScheduleSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(settingsProvider.select((c) => c.schedule));

    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(t.scheduleSettingsScreen.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildAcademicTerm(ref, config),
            _buildClassDays(ref, config),
            _buildPeriodCount(ref, config),
            _buildRepeatSchedule(ref, config),
            _buildBellSchedule(ref, config),
          ],
        ),
      ),
    );
  }

  Widget _buildAcademicTerm(WidgetRef ref, ScheduleConfig config) {
    return ListTile(
      leading: const Icon(Symbols.school),
      title: Text(t.scheduleSettingsScreen.academicTerm),
      subtitle: Text(config.academicTerm.tr()),
      onTap: () => showModalDialog<AcademicTerm>(
        builder: (_) => ValueListDialog(
          title: t.scheduleSettingsScreen.academicTerm,
          values: AcademicTerm.values,
          initialValue: config.academicTerm,
          textBuilder: (value) => value.tr(),
        ),
        onSaved: (value) => _updateConfig(
          ref,
          config.copyWith(academicTerm: value),
        ),
      ),
    );
  }

  Widget _buildClassDays(WidgetRef ref, ScheduleConfig config) {
    final text = DateHelper.getAbbrNamesOfWeekdays(config.classDays).join(', ');

    return ListTile(
      leading: const Icon(Symbols.date_range),
      title: Text(t.scheduleSettingsScreen.classDays),
      subtitle: Text(text),
      onTap: () => showModalDialog<List<bool>>(
        builder: (context) => CheckboxListDialog(
          title: t.scheduleSettingsScreen.classDays,
          items: DateHelper.getNamesOfWeekdays(context),
          values: DateHelper.weekdaysToMask(config.classDays),
          onValidate: (values) => values.contains(true),
        ),
        onSaved: (value) => _updateConfig(
          ref,
          config.copyWith(classDays: DateHelper.maskToWeekdays(value)),
        ),
      ),
    );
  }

  Widget _buildPeriodCount(WidgetRef ref, ScheduleConfig config) {
    return ListTile(
      leading: const Icon(Symbols.schedule),
      title: Text(t.scheduleSettingsScreen.periodCount),
      subtitle: Text(t.scheduleSettingsScreen.periodCountText(count: config.periodCount)),
      onTap: () => showModalDialog<int>(
        builder: (_) => ValueListDialog(
          title: t.scheduleSettingsScreen.periodCount,
          values: List.generate(9, (i) => i + 4),
          initialValue: config.periodCount,
          textBuilder: (value) => value.toString(),
          alignment: Alignment.center,
        ),
        onSaved: (value) => _updateConfig(
          ref,
          config.copyWith(periodCount: value),
        ),
      ),
    );
  }

  Widget _buildRepeatSchedule(WidgetRef ref, ScheduleConfig config) {
    return ListTile(
      leading: const Icon(Symbols.event_repeat),
      title: Text(t.scheduleSettingsScreen.repeatSchedule),
      subtitle: Text(config.repeatSchedule.tr()),
      onTap: () => showModalDialog<RepeatSchedule>(
        builder: (_) => ValueListDialog(
          title: t.scheduleSettingsScreen.repeatSchedule,
          values: RepeatSchedule.values,
          initialValue: config.repeatSchedule,
          textBuilder: (value) => value.tr(),
        ),
        onSaved: (value) => _updateConfig(
          ref,
          config.copyWith(repeatSchedule: value),
        ),
      ),
    );
  }

  Widget _buildBellSchedule(WidgetRef ref, ScheduleConfig config) {
    return ListTile(
      leading: const Icon(Symbols.notifications_active),
      title: Text(t.scheduleSettingsScreen.bellSchedule),
      subtitle: Text(config.bellSchedule.tr()),
      onTap: () => showModalDialog<BellSchedule>(
        builder: (_) => ValueListDialog(
          title: t.scheduleSettingsScreen.bellSchedule,
          values: BellSchedule.values,
          initialValue: config.bellSchedule,
          textBuilder: (value) => value.tr(),
        ),
        onSaved: (value) => _updateConfig(
          ref,
          config.copyWith(bellSchedule: value),
        ),
      ),
    );
  }

  void _updateConfig(WidgetRef ref, ScheduleConfig value) {
    logEvent(AnalyticsEvent.settingsUpdate);

    ref.read(settingsProvider.notifier).schedule = value;
    ref.read(settingsProvider.notifier).save();
  }
}

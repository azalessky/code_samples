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
class GradesSettingsScreen extends ConsumerWidget {
  const GradesSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(settingsProvider.select((c) => c.grades));

    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(t.gradesSettingsScreen.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildGradeScale(ref, config),
            _buildPlusMinusValues(ref, config),
            _buildRoundingRules(ref, config),
            _buildGradeColors(ref, config),
            _buildattendanceMarks(ref, config),
          ],
        ),
      ),
    );
  }

  Widget _buildGradeScale(WidgetRef ref, GradesConfig config) {
    return ListTile(
      leading: const Icon(Symbols.grade),
      title: Text(t.gradesSettingsScreen.gradeScale),
      subtitle: Text(config.gradeScale.tr()),
      onTap: () => showModalDialog<GradeScale>(
        builder: (_) => ValueListDialog(
          title: t.gradesSettingsScreen.gradeScale,
          values: GradeScale.values,
          initialValue: config.gradeScale,
          textBuilder: (value) => value.tr(),
        ),
        onSaved: (value) {
          final updated = config.copyWith(gradeScale: value);
          final helper = GradesHelper(updated);
          final ranges = helper.defaultColorRanges();

          _updateConfig(ref, updated.copyWith(gradeColors: ranges));
        },
      ),
    );
  }

  Widget _buildPlusMinusValues(WidgetRef ref, GradesConfig config) {
    return ListTile(
      leading: const Icon(Symbols.balance),
      title: Text(t.gradesSettingsScreen.signValues),
      subtitle: Text(
        t.gradesSettingsScreen.signValuesText(
          plus: config.plusValue,
          minus: config.minusValue,
        ),
      ),
      onTap: () => showModalDialog<List<num>>(
        builder: (_) => InputListDialog(
          title: t.gradesSettingsScreen.signValues,
          initialValue: [
            config.plusValue,
            config.minusValue,
          ],
          labelBuilder: (index) => switch (index) {
            0 => t.gradesSettingsScreen.signValuesPlus,
            1 => t.gradesSettingsScreen.signValuesMinus,
            _ => '',
          },
          validator: (index, value) => switch (index) {
            0 => value >= 0 ? null : '',
            1 => value <= 0 ? null : '',
            _ => null,
          },
        ),
        onSaved: (value) => _updateConfig(
          ref,
          config.copyWith(
            plusValue: value[0] as double,
            minusValue: value[1] as double,
          ),
        ),
      ),
    );
  }

  Widget _buildRoundingRules(WidgetRef ref, GradesConfig config) {
    return ListTile(
      leading: const Icon(Symbols.functions),
      title: Text(t.gradesSettingsScreen.roundingRules),
      subtitle: Text(
        t.gradesSettingsScreen.roundingRulesText(
          threshold: config.roundingThreshold,
          precision: config.roundingPrecision,
        ),
      ),
      onTap: () => showModalDialog<List<num>>(
        builder: (_) => InputListDialog(
          title: t.gradesSettingsScreen.roundingRules,
          initialValue: [
            config.roundingThreshold,
            config.roundingPrecision,
          ],
          labelBuilder: (index) => switch (index) {
            0 => t.gradesSettingsScreen.roundingRulesThreshold,
            1 => t.gradesSettingsScreen.roundingRulesPrecision,
            _ => '',
          },
          validator: (index, value) => switch (index) {
            0 => value >= 0 && value <= 1 ? null : '',
            1 => value >= 0 && value <= 3 ? null : '',
            _ => null,
          },
        ),
        onSaved: (value) => _updateConfig(
          ref,
          config.copyWith(
            roundingThreshold: value[0] as double,
            roundingPrecision: value[1] as int,
          ),
        ),
      ),
    );
  }

  Widget _buildGradeColors(WidgetRef ref, GradesConfig config) {
    return ListTile(
      leading: const Icon(Symbols.palette),
      title: Text(t.gradesSettingsScreen.gradeColors),
      subtitle: Text(GradesHelper(config).formatColorRanges()),
      onTap: () => showModalDialog<List<ColorRange>>(
        builder: (_) => ColorRangesDialog(
          initialValue: config.gradeColors,
          title: t.gradesSettingsScreen.gradeColors,
          dialogTitle: t.gradesSettingsScreen.gradeColorsTitle,
          otherLabel: t.gradesSettingsScreen.gradeColorsOther,
        ),
        onSaved: (value) => _updateConfig(
          ref,
          config.copyWith(gradeColors: value),
        ),
      ),
    );
  }

  Widget _buildattendanceMarks(WidgetRef ref, GradesConfig config) {
    final text = config.attendanceMarks
        .map((e) => GradesHelper(config).attendanceCode(e))
        .join(', ');

    return ListTile(
      leading: const Icon(Symbols.directions_run),
      title: Text(t.gradesSettingsScreen.attendanceMarks),
      subtitle: Text(text),
      onTap: () => showModalDialog<List<String>>(
        builder: (_) => ObjectListDialog<String>(
          title: t.gradesSettingsScreen.attendanceMarks,
          inputTitle: t.gradesSettingsScreen.attendanceMark,
          inputHintText: t.gradesSettingsScreen.attendanceName,
          initialValue: config.attendanceMarks,
          maxLength: FieldConstraints.gradeAttendanceLength,
          textBuilder: (value) => value,
          objectBuilder: (value) => value,
        ),
        onSaved: (value) => _updateConfig(
          ref,
          config.copyWith(attendanceMarks: value),
        ),
      ),
    );
  }

  void _updateConfig(WidgetRef ref, GradesConfig value) {
    logEvent(AnalyticsEvent.settingsUpdate);

    ref.read(settingsProvider.notifier).grades = value;
    ref.read(settingsProvider.notifier).save();
  }
}

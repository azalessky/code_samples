import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/features/shared/shared.dart';
import 'package:student_planner/features/schedule/schedule.dart';

class ScheduleView extends ConsumerStatefulWidget {
  final DateTime date;

  const ScheduleView(this.date, {super.key});

  @override
  ConsumerState<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends ConsumerState<ScheduleView> {
  final headerPadding = EdgeInsets.all(10 + (Platform.isIOS ? 2 : 0));
  final cellPadding = EdgeInsets.symmetric(horizontal: 8, vertical: 12 + (Platform.isIOS ? 2 : 0));
  final columnWidths = {
    0: FixedColumnWidth(33),
    1: FlexColumnWidth(120),
    2: FlexColumnWidth(140),
    3: FixedColumnWidth(45),
  };

  @override
  Widget build(BuildContext context) {
    ref.watch(periodsProvider);
    ref.watch(assignmentsProvider);
    ref.watch(gradesProvider);
    ref.watch(termsProvider);
    ref.watch(notesProvider);

    final periodCount = ref.read(settingsProvider).periodCount;
    final periods = ref.read(periodsProvider.notifier);
    final terms = ref.read(termsProvider.notifier);
    final note = ref.read(notesProvider.notifier).getNote(widget.date);

    final showSchedule = terms.isStudy(widget.date) || !terms.isHoliday(widget.date);
    return showSchedule
        ? SingleChildScrollView(
            child: Column(
              children: [
                FormLayout.sectionSpacer,
                _buildSchedule(context, periods.getPeriods(widget.date, periodCount)),
                FormLayout.largeSpacer,
                _buildNote(context, note),
              ],
            ),
          )
        : _buildHoliday(context, terms.getTerm(widget.date, TermType.holiday)!.name);
  }

  Widget _buildHoliday(BuildContext context, String text) {
    return SpacePlaceholder(
      text: 'ScheduleView.HolidayText'.tr(args: [text]),
    );
  }

  Widget _buildSchedule(BuildContext context, List<Period> periods) {
    return Table(
      border: TableBorder.all(color: Theme.of(context).colorScheme.outline),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: columnWidths,
      children: List<TableRow>.generate(
        periods.length + 1,
        (index) =>
            index == 0 ? _buildTableHeader(context) : _buildTableRow(context, periods[index - 1]),
      ),
    );
  }

  Widget _buildNote(BuildContext context, Note? note) {
    return NoteText(
      note: note,
      date: widget.date,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
      ),
      hintText: 'ScheduleView.NoteHint'.tr(),
    );
  }

  TableRow _buildTableHeader(BuildContext context) {
    return TableRow(
      children: [
        _buildHeaderCell(context, 'ScheduleView.PeriodHeader'.tr()),
        _buildHeaderCell(context, 'ScheduleView.SubjectHeader'.tr()),
        _buildHeaderCell(context, 'ScheduleView.AssignmentHeader'.tr()),
        _buildHeaderCell(context, 'ScheduleView.GradeHeader'.tr()),
      ],
    );
  }

  Widget _buildHeaderCell(BuildContext context, String text) {
    return ScheduleCell(
      text: text,
      textStyle: Theme.of(context).textTheme.titleSmall,
      padding: headerPadding,
    );
  }

  TableRow _buildTableRow(BuildContext context, Period period) {
    final grade = ref.read(gradesProvider.notifier).getGrade(period.id);
    final assignment = ref.read(assignmentsProvider.notifier).getAssignment(period.id);

    return TableRow(
      children: [
        ScheduleCell(
          text: (period.slot + 1).toString(),
          padding: cellPadding,
          alignment: Alignment.center,
        ),
        ScheduleCell(
          text: period.subject,
          padding: cellPadding,
          alignment: Alignment.centerLeft,
          onTap: () => _selectSubject(period),
        ),
        ScheduleCell(
          text: assignment?.text,
          padding: cellPadding,
          alignment: Alignment.centerLeft,
          onTap: () => _selectAssignment(assignment, period),
          icon: _buildSuffixIcon(assignment),
        ),
        ScheduleCell(
          text: grade?.valueText,
          padding: cellPadding,
          alignment: Alignment.center,
          onTap: () => _selectGrade(context, period, grade),
        ),
      ],
    );
  }

  Icon? _buildSuffixIcon(Assignment? assignment) {
    return assignment?.completed == true
        ? Icon(
            Symbols.check,
            size: 16,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          )
        : null;
  }

  void _selectSubject(Period period) {
    showModalDialog<String>(
      context: context,
      builder: (context) {
        return ValueListDialog(
          values: ref.read(subjectsProvider.notifier).names,
          initialValue: period.subject,
          textBuilder: (value) => value,
          clearButton: period.subject.isNotEmpty,
        );
      },
      onSaved: (value) {
        logEvent(AnalyticsEvent.scheduleSelectSubject);

        final repeat = ref.read(settingsProvider).repeatSchedule;
        ref.read(gradesProvider.notifier).updateSubject(period.id, value);
        ref.read(assignmentsProvider.notifier).updateSubject(period.id, value);
        ref.read(periodsProvider.notifier).updatePeriod(period.copyWith(subject: value), repeat);
        cachedRepository.saveData();
      },
    );
  }

  void _selectGrade(BuildContext context, Period period, Grade? grade) {
    showModalDialog<List<GradeValue>>(
      context: context,
      builder: (context) => GradeInputDialog(
        initialValue: grade?.values,
        gradingScale: ref.read(settingsProvider).gradingScale,
      ),
      onSaved: (value) async {
        logEvent(AnalyticsEvent.scheduleSelectGrade);

        if (value.isEmpty) {
          final result = await showPromptDialog(
            context: context,
            title: 'Prompt.Confirmation'.tr(),
            text: 'Prompt.DeleteGrade'.tr(),
          );
          if (result != true) return;
        }

        ref.read(gradesProvider.notifier).updatePeriodGrade(period, value);
        ref.read(periodsProvider.notifier).updatePeriod(period);
        cachedRepository.saveData();
      },
    );
  }

  void _selectAssignment(Assignment? assignment, Period period) {
    context.pushRoute(
      AssignmentDetailRoute(assignment: assignment, period: period),
    );
  }
}

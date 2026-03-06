import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/controllers/controllers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/features/schedule/schedule.dart';
import 'package:student_planner/shared/shared.dart';

class ScheduleTable extends ConsumerStatefulWidget {
  final DateTime date;
  final List<Period?> periods;
  final bool compact;

  const ScheduleTable({
    required this.date,
    required this.periods,
    this.compact = false,
    super.key,
  });

  @override
  ConsumerState<ScheduleTable> createState() => _ScheduleTableState();
}

class _ScheduleTableState extends ConsumerState<ScheduleTable> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(settingsProvider);
    ref.watch(assignmentsProvider);
    ref.watch(labelsProvider);
    ref.watch(gradesProvider);
    ref.watch(notesProvider);

    final borderColor = Theme.of(context).colorScheme.outline;
    final alignment = widget.compact
        ? TableCellVerticalAlignment.middle
        : TableCellVerticalAlignment.intrinsicHeight;

    final columnWidths = {
      0: IntrinsicColumnWidth(),
      1: FlexColumnWidth(),
      2: MaxColumnWidth(FixedColumnWidth(40), IntrinsicColumnWidth()),
    };

    return Table(
      border: TableBorder.all(color: borderColor),
      defaultVerticalAlignment: alignment,
      columnWidths: columnWidths,
      children: [
        if (!widget.compact) _buildHeaderRow(),
        ...widget.periods.mapIndexed(
          (slot, period) => _buildScheduleRow(period, slot),
        ),
      ],
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      children: [
        _buildHeaderCell(t.scheduleScreen.numberHeader),
        _buildHeaderCell(t.scheduleScreen.lessonHeader),
        _buildHeaderCell(t.scheduleScreen.gradeHeader),
      ],
    );
  }

  Widget _buildHeaderCell(String text) {
    return ScheduleCell(
      child: Text(
        text,
        style: context.textTheme.titleSmall,
      ),
    );
  }

  TableRow _buildScheduleRow(Period? period, int slot) {
    final config = ref.read(settingsProvider).grades;
    final grade = ref.read(gradesProvider.notifier).getGrade(period?.id ?? '');
    final assignment = ref.read(assignmentsProvider.notifier).getAssignment(period?.id ?? '');
    final labels = ref.read(labelsProvider.notifier).getLabels(assignment?.labels ?? []);

    final numberPadding = FormLayout.textPadding + .symmetric(horizontal: 2);
    final subjectPadding = FormLayout.textPadding + .symmetric(horizontal: widget.compact ? 0 : 4);
    final gradePadding = FormLayout.textPadding - .all(2);

    return TableRow(
      children: [
        ScheduleCell(
          padding: numberPadding,
          child: Text(
            (slot + 1).toString(),
            textAlign: .center,
          ),
        ),
        if (widget.compact)
          ScheduleCell(
            padding: subjectPadding,
            alignment: .centerLeft,
            child: Text(
              period?.subject ?? '',
              maxLines: 1,
              overflow: .ellipsis,
            ),
            onTap: () => LessonController(ref).selectSubject(
              period ?? Period.fromSlot(widget.date, slot),
            ),
          )
        else ...[
          LessonCell(
            period: period,
            assignment: assignment,
            labels: labels,
            padding: subjectPadding,
            onTap: () => _selectLesson(period, slot, assignment),
          ),
          ScheduleCell(
            padding: gradePadding,
            child: grade != null ? GradeText(config: config, grade: grade) : null,
            onTap: () => GradeController(ref).showPeriodGrade(
              grade,
              period ?? Period.fromSlot(widget.date, slot),
            ),
          ),
        ],
      ],
    );
  }

  void _selectLesson(Period? period, int slot, Assignment? assignment) {
    period ??= Period.fromSlot(widget.date, slot);
    assignment ??= Assignment.fromPeriod(period);

    context.pushRoute(LessonDetailRoute(period: period, assignment: assignment));
  }
}

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/controllers/controllers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class GradesHistoryScreen extends ConsumerWidget {
  final String subject;
  final Term? term;

  const GradesHistoryScreen({
    required this.subject,
    required this.term,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(gradesProvider);

    final config = ref.watch(settingsProvider.select((c) => c.grades));
    final grades = ref
        .read(gradesProvider.notifier)
        .getGrades(GradeType.period, subject, term?.dates);

    return BackgroundScaffold(
      appBar: CustomAppBar(title: subject, subtitle: term?.name),
      body: grades.isNotEmpty
          ? _buildDataTable(context, ref, config, grades)
          : SpacePlaceholder(text: t.gradesHistoryScreen.noData),
    );
  }

  Widget _buildDataTable(
    BuildContext context,
    WidgetRef ref,
    GradesConfig config,
    List<Grade> grades,
  ) {
    final columns = [
      t.gradesHistoryScreen.date,
      t.gradesHistoryScreen.grade,
      t.gradesHistoryScreen.comment,
    ];

    return FlexibleTable(
      rowCount: grades.length,
      columns: columns
          .mapIndexed(
            (index, title) => FlexibleColumn(
              title: title,
              width: FlexColumnWidth(),
              textAlign: .center,
              onTap: index == 0
                  ? null
                  : (row) => GradeController(ref).showHistoryGrade(grades[row]),
            ),
          )
          .toList(),
      textBuilder: (column, row) {
        final grade = grades[row];
        return switch (column) {
          0 => _formatDate(context, grade.date),
          1 => GradesHelper(config).gradeText(grade),
          2 => grade.comment,
          _ => '',
        };
      },
      cellBuilder: (column, row) =>
          column == 1 ? GradeText(config: config, grade: grades[row]) : null,
    );
  }

  String _formatDate(BuildContext context, DateTime date) {
    final today = DateHelper.today;
    final pattern = date.year == today.year
        ? DateFormat.NUM_MONTH_DAY
        : DateFormat.YEAR_NUM_MONTH_DAY;
    return date.format(pattern);
  }
}

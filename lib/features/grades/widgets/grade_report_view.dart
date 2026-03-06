import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/controllers/controllers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/shared/shared.dart';

class GradeReportView extends ConsumerWidget {
  static const maxColumnCount = 5;

  final Term? year;

  const GradeReportView({
    this.year,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(settingsProvider.select((c) => c.grades));
    ref.watch(termsProvider);
    ref.watch(gradesProvider);
    ref.watch(subjectsProvider);

    return _buildBody(context, ref, year);
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, Term? year) {
    if (year != null) {
      final config = ref.read(settingsProvider).grades;
      final terms = _getTerms(ref, year);
      final subjects = _getSubjects(ref, year);

      return subjects.isNotEmpty
          ? _buildDataTable(context, ref, config, terms, subjects)
          : SpacePlaceholder(text: t.gradeReportView.noGrades);
    } else {
      return SpacePlaceholder(text: t.gradeReportView.noData);
    }
  }

  Widget _buildDataTable(
    BuildContext context,
    WidgetRef ref,
    GradesConfig config,
    List<Term> terms,
    List<String> subjects,
  ) {
    final grades = ref.read(gradesProvider.notifier);
    final columnCount = min(terms.length, GradeReportView.maxColumnCount);

    return FlexibleTable(
      rowCount: subjects.length,
      headingTextStyle: context.textTheme.titleMedium,
      columns: [
        FlexibleColumn(
          title: t.gradeReportView.subject,
          width: FlexColumnWidth(),
          alignment: .centerLeft,
        ),
        ...List<FlexibleColumn>.generate(
          columnCount,
          (index) => FlexibleColumn(
            title: index < columnCount - 1
                ? t.gradeReportView.terms[index]
                : t.gradeReportView.year,
            tooltip: _formatTooltip(terms[index]),
            width: FixedColumnWidth(38),
            onTap: (row) => GradeController(ref).showTermGrade(
              grades.getGrade(terms[index].id, subjects[row]),
              terms[index],
              subjects[row],
            ),
          ),
        ),
      ],
      textBuilder: (column, row) => column == 0 ? subjects[row] : '',
      cellBuilder: (column, row) => column > 0
          ? _buildGrade(config, grades.getGrade(terms[column - 1].id, subjects[row]))
          : null,
    );
  }

  List<Term> _getTerms(WidgetRef ref, Term year) {
    final children = ref.read(termsProvider.notifier).getStudies(year);
    final terms = children.take(GradeReportView.maxColumnCount - 1).toList()..add(year);
    return terms;
  }

  List<String> _getSubjects(WidgetRef ref, Term year) {
    final currentYear = ref.read(termsProvider.notifier).getCurrentTerm(TermType.year);

    var subjects = ref.read(gradesProvider.notifier).getSubjects(null, year.dates);
    if (year.id != currentYear?.id) return subjects;

    final currentSubjects = ref.read(subjectsProvider.notifier).names..addAll(subjects);
    subjects = currentSubjects.toSet().toList()..sort();

    return subjects;
  }

  String _formatTooltip(Term term) {
    return '${term.name}\n${DateHelper.formatDateRange(term.start, term.end)}';
  }

  Widget? _buildGrade(GradesConfig config, Grade? grade) {
    return grade != null ? GradeText(config: config, grade: grade) : Text('—');
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/features/shared/shared.dart';

class GradeReportScreen extends ConsumerWidget {
  static const maxColumnCount = 5;

  const GradeReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logEvent(AnalyticsEvent.gradesShowReport);

    ref.watch(termsProvider);
    ref.watch(gradesProvider);
    ref.watch(subjectsProvider);

    final scale = ref.watch(settingsProvider).gradingScale;
    final subjects = ref.read(subjectsProvider.notifier).names;
    final grades = ref.read(gradesProvider.notifier);
    final terms = ref.read(termsProvider.notifier).getTerms(TermType.study);
    final columnCount = min(terms.length + 1, maxColumnCount);

    return terms.isNotEmpty
        ? FlexibleTable(
            rowCount: subjects.length,
            columns: [
              FlexibleColumn(
                title: 'GradeBookScreen.Subject'.tr(),
                width: 0,
                align: TextAlign.start,
              ),
              ...List<FlexibleColumn>.generate(
                columnCount,
                (index) {
                  bool termColumn = index < columnCount - 1;
                  return FlexibleColumn(
                    title: termColumn
                        ? 'GradeReportScreen.Term${index + 1}'.tr()
                        : 'GradeReportScreen.Average'.tr(),
                    width: termColumn ? 35 : (scale == GradingScale.alphabetic ? 27 : 22),
                    align: termColumn ? TextAlign.center : TextAlign.end,
                    onTap: termColumn
                        ? (row) => _selectGrade(
                              context,
                              ref,
                              terms[index],
                              grades.getGrade(terms[index].id, subjects[row]),
                              subjects[row],
                            )
                        : null,
                  );
                },
              ),
            ],
            textBuilder: (column, row) {
              if (column == 0) {
                return subjects[row];
              } else if (column < columnCount) {
                return _formatGrade(grades.getGrade(terms[column - 1].id, subjects[row]));
              } else {
                return grades.termsAverage(
                  terms.map((t) => t.id).toList(),
                  subjects[row],
                  scale == GradingScale.alphabetic ? 1 : 0,
                );
              }
            })
        : SpacePlaceholder(text: 'GradeReportScreen.NoData'.tr());
  }

  String _formatGrade(Grade? grade) {
    return grade == null ? '—' : grade.valueText;
  }

  void _selectGrade(BuildContext context, WidgetRef ref, Term term, Grade? grade, String subject) {
    showModalDialog<List<GradeValue>>(
      context: context,
      builder: (context) => GradeInputDialog(
        initialValue: grade?.values,
        gradingScale: ref.read(settingsProvider).gradingScale,
      ),
      onSaved: (value) => _saveGrade(ref, term, grade, subject, value),
    );
  }

  void _saveGrade(WidgetRef ref, Term term, Grade? grade, String subject, List<GradeValue> values) {
    logEvent(AnalyticsEvent.gradesSelectGrade);
    ref.read(gradesProvider.notifier).updateTermGrade(term, subject, values);
    cachedRepository.saveData();
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/features/shared/shared.dart';

class GradeBookScreen extends ConsumerWidget {
  const GradeBookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logEvent(AnalyticsEvent.gradesShowBook);
    ref.watch(gradesProvider);

    final scale = ref.watch(settingsProvider).gradingScale;
    final grades = ref.read(gradesProvider.notifier).getGrades(GradeType.period);
    final subjects = ref.read(gradesProvider.notifier).getSubjects(GradeType.period);

    return grades.isNotEmpty
        ? FlexibleTable(
            rowCount: subjects.length,
            columns: [
              FlexibleColumn(
                title: 'GradeBookScreen.Subject'.tr(),
                width: 150,
                align: TextAlign.start,
              ),
              FlexibleColumn(
                title: 'GradeBookScreen.Grades'.tr(),
                width: 0,
                align: TextAlign.end,
                onTap: (row) => context.pushRoute(GradeHistoryRoute(subject: subjects[row])),
              ),
              FlexibleColumn(
                title: 'GradeBookScreen.Average'.tr(),
                width: scale == GradingScale.alphabetic ? 40 : 35,
                align: TextAlign.end,
              ),
            ],
            textBuilder: (column, row) => switch (column) {
              0 => subjects[row],
              1 => _formatGrades(grades, subjects[row]),
              2 => _formatAverage(ref, subjects[row], scale),
              _ => ''
            },
          )
        : SpacePlaceholder(text: 'GradeBookScreen.NoData'.tr());
  }

  String _formatGrades(List<Grade> grades, String subject) {
    final data = grades.where((g) => g.subject == subject).map((g) => g.valueText).toList();
    return data.foldSeparated(' ');
  }

  String _formatAverage(WidgetRef ref, String subject, GradingScale scale) {
    final grades = ref.read(gradesProvider.notifier);
    return grades.subjectAverage(subject, scale == GradingScale.alphabetic ? 1 : 0);
  }
}

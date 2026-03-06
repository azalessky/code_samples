import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/shared/shared.dart';

class GradeBookView extends ConsumerWidget {
  final Term? term;

  const GradeBookView({
    super.key,
    this.term,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(settingsProvider.select((c) => c.grades));
    ref.watch(gradesProvider);
    ref.watch(termsProvider);

    final config = ref.read(settingsProvider).grades;
    final grades = ref.read(gradesProvider.notifier).getGrades(GradeType.period, null, term?.dates);
    final subjects = ref.read(gradesProvider.notifier).getSubjects(GradeType.period, term?.dates);

    return grades.isNotEmpty
        ? _buildDataTable(context, ref, config, subjects, grades)
        : SpacePlaceholder(text: t.gradeBookView.noData);
  }

  Widget _buildDataTable(
    BuildContext context,
    WidgetRef ref,
    GradesConfig config,
    List<String> subjects,
    List<Grade> grades,
  ) {
    return ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (_, index) {
        final subject = subjects[index];
        final values = grades.where((g) => g.subject == subject).toList();
        final average = GradesHelper(config).subjectAverage(values);

        return _buildDataRow(context, config, subject, values, average);
      },
    );
  }

  Widget _buildDataRow(
    BuildContext context,
    GradesConfig config,
    String subject,
    List<Grade> grades,
    Grade average,
  ) {
    final gradeList = grades.map((g) => GradesHelper(config).gradeText(g)).join('  ');

    return ListTile(
      visualDensity: .compact,
      contentPadding: FormLayout.listPadding,
      title: context.textLarge(subject),
      subtitle: context.textMedium(gradeList),
      trailing: GradeText(config: config, grade: average),
      onTap: () => context.pushRoute(
        GradesHistoryRoute(
          subject: subject,
          term: term,
        ),
      ),
    );
  }
}

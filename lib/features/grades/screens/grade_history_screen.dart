import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/features/shared/shared.dart';

@RoutePage()
class GradeHistoryScreen extends ConsumerWidget {
  final String subject;

  const GradeHistoryScreen({
    required this.subject,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logEvent(AnalyticsEvent.gradesShowHistory);
    ref.watch(gradesProvider);

    final grades = ref.read(gradesProvider.notifier).getGrades(GradeType.period, subject);

    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(subject),
      ),
      body: grades.isNotEmpty
          ? FlexibleTable(
              rowCount: grades.length,
              columns: [
                FlexibleColumn(
                  title: 'GradeHistoryScreen.Value'.tr(),
                  width: 0,
                  align: TextAlign.center,
                  onTap: (row) => _selectGrade(context, ref, grades[row]),
                ),
                FlexibleColumn(
                  title: 'GradeHistoryScreen.Weight'.tr(),
                  width: 0,
                  align: TextAlign.center,
                  onTap: (row) => _selectGrade(context, ref, grades[row]),
                ),
                FlexibleColumn(
                  title: 'GradeHistoryScreen.Date'.tr(),
                  width: 0,
                  align: TextAlign.center,
                ),
              ],
              textBuilder: (column, row) => switch (column) {
                0 => grades[row].valueText,
                1 => grades[row].weightText.ifEmpty('—'),
                2 => DateFormat.yMd().format(grades[row].date),
                _ => '',
              },
            )
          : SpacePlaceholder(text: 'GradeHistoryScreen.NoData'.tr()),
    );
  }

  void _selectGrade(BuildContext context, WidgetRef ref, Grade grade) async {
    showModalDialog<List<GradeValue>>(
      context: context,
      builder: (context) => GradeInputDialog(
        initialValue: grade.values,
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

        ref.read(gradesProvider.notifier).updateGrade(grade.copyWith(values: value));
        cachedRepository.saveData();
      },
    );
  }
}

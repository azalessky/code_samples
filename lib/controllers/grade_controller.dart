import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

class GradeController {
  final WidgetRef ref;

  const GradeController(this.ref);

  void showPeriodGrade(Grade? grade, Period period) {
    _showGrade(grade: grade, period: period);
  }

  void showTermGrade(Grade? grade, Term term, String subject) {
    _showGrade(grade: grade, term: term, subject: subject);
  }

  void showHistoryGrade(Grade grade) {
    final period = ref.read(periodsProvider.notifier).getItem(grade.refId);
    _showGrade(grade: grade, period: period);
  }

  void _showGrade({required Grade? grade, Term? term, Period? period, String? subject}) {
    final config = ref.read(settingsProvider).grades;
    final grades = ref.read(gradesProvider.notifier);
    final periods = ref.read(periodsProvider.notifier);
    final type = term != null ? GradeType.term : GradeType.period;

    showModalDialog<Grade>(
      builder: (_) => GradeInputDialog(
        initialValue: grade,
        config: config,
        comments: grades.getComments(type),
        singleValue: term != null,
        editWeight: term == null,
        editAttendance: term == null,
      ),
      onSaved: (value) async {
        if (value.isEmpty) {
          final result = await showPromptDialog(
            title: t.prompt.titleConfirmation,
            text: t.prompt.deleteGrade,
          );
          if (result != true) return;

          logEvent(AnalyticsEvent.gradesDeleteItem);
          grades.removeItem(grade!.id);
        } else {
          logEvent(AnalyticsEvent.gradesUpdateItem);

          if (period != null) {
            if (grade == null) {
              grades.addItem(Grade.withPeriod(value, period));
              periods.setItem(period);
            } else {
              grades.setItem(value);
            }
          } else if (term != null) {
            grades.updateTermGrade(term, subject!, value.values, value.comment);
          }
        }
        grades.save();
      },
    );
  }
}

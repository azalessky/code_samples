import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/managers/managers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

class LessonController {
  final WidgetRef ref;

  const LessonController(this.ref);

  void updateLesson(Period period, Assignment? assignment) {
    logEvent(AnalyticsEvent.lessonsUpdateItem);

    final repeat = ref.read(settingsProvider).schedule.repeatSchedule;
    ref.read(periodsProvider.notifier).updatePeriod(period, repeat);
    ref.read(periodsProvider.notifier).save();

    if (assignment != null) {
      final updated = assignment.copyWith(subject: period.subject, archived: false);
      ref.read(assignmentsProvider.notifier).setItem(updated);
    }

    ref.read(assignmentsProvider.notifier).updateSubject(period.id, period.subject);
    ref.read(assignmentsProvider.notifier).save();

    ref.read(gradesProvider.notifier).updateSubject(period.id, period.subject);
    ref.read(gradesProvider.notifier).save();
  }

  void selectSubject(Period period) {
    logEvent(AnalyticsEvent.lessonsUpdateItem);

    final subjects = ref.read(subjectsProvider.notifier).names;

    showModalDialog<String>(
      builder: (context) => ValueListDialog(
        values: subjects,
        initialValue: period.subject,
        textBuilder: (value) => value,
        clearTitle: period.subject.isNotEmpty == true ? t.button.delete : null,
        onSelected: (value) {
          final subject = value ?? '';
          final updated = period.copyWith(subject: subject);
          final repeat = ref.read(settingsProvider).schedule.repeatSchedule;

          ref.read(periodsProvider.notifier).updatePeriod(updated, repeat);
          ref.read(periodsProvider.notifier).save();

          ref.read(assignmentsProvider.notifier).updateSubject(updated.id, subject);
          ref.read(assignmentsProvider.notifier).save();

          ref.read(gradesProvider.notifier).updateSubject(updated.id, subject);
          ref.read(gradesProvider.notifier).save();
        },
      ),
    );
  }

  void shareLesson(BuildContext context, Period period, Assignment assignment) {
    logEvent(AnalyticsEvent.lessonsShareContent);
    ShareActionManager.shareContent(context, period, assignment);
  }

  void deleteLesson(BuildContext context, Period period, Assignment assignment) {
    showPromptDialog(
      title: t.prompt.titleConfirmation,
      text: t.prompt.deleteLesson,
      onConfirmed: () {
        logEvent(AnalyticsEvent.lessonsDeleteItem);

        final repeat = ref.read(settingsProvider).schedule.repeatSchedule;
        ref.read(periodsProvider.notifier).removePeriod(period, repeat);
        ref.read(periodsProvider.notifier).save();

        ref.read(assignmentsProvider.notifier).removeItem(assignment.id);
        ref.read(assignmentsProvider.notifier).save();

        ref.read(gradesProvider.notifier).removeGrades(period.id);
        ref.read(gradesProvider.notifier).save();

        context.maybePop(assignment);
      },
    );
  }
}

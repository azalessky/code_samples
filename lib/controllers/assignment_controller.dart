import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/managers/managers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

class AssignmentController {
  final WidgetRef ref;

  const AssignmentController(this.ref);

  void updateAssignment(Assignment assignment) {
    logEvent(AnalyticsEvent.assignmentsUpdateItem);

    final updated = assignment.copyWith(archived: false);
    ref.read(assignmentsProvider.notifier).setItem(updated);
    ref.read(assignmentsProvider.notifier).save();
  }

  void moveAssignment(
    BuildContext context,
    Assignment assignment,
    List<Period> periods,
    String dialogTitle,
  ) {
    showModalDialog<Period>(
      builder: (_) => ValueListDialog(
        title: dialogTitle,
        values: periods,
        textBuilder: (value) => value.date.format(DateFormat.MONTH_DAY),
      ),
      onSaved: (value) {
        logEvent(AnalyticsEvent.assignmentsUpdateItem);

        final updated = assignment.copyWith(date: value.date, refId: value.id);
        ref.read(assignmentsProvider.notifier).setItem(updated);
        ref.read(assignmentsProvider.notifier).save();

        context.maybePop();
      },
    );
  }

  void shareAssignment(BuildContext context, Assignment assignment) {
    logEvent(AnalyticsEvent.assignmentsShareContent);
    ShareActionManager.shareContent(context, null, assignment);
  }

  void deleteAssignment(BuildContext context, Assignment assignment) {
    showPromptDialog(
      title: t.prompt.titleConfirmation,
      text: t.prompt.deleteAssignment,
      onConfirmed: () {
        logEvent(AnalyticsEvent.assignmentsDeleteItem);

        ref.read(assignmentsProvider.notifier).removeItem(assignment.id);
        ref.read(assignmentsProvider.notifier).save();
        context.maybePop(assignment);
      },
    );
  }

  void completeAssignment(BuildContext context, bool complete) {
    if (complete) {
      logEvent(AnalyticsEvent.assignmentsCompleteItem);

      context.maybePop();
      messages.showMessage(UserMessage.assignmentCompleted);
      ReviewService.requestReview();
    }
  }
}

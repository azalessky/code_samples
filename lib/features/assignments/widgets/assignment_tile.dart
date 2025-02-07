import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/features/shared/shared.dart';

class AssignmentTile extends StatelessWidget {
  final Assignment assignment;
  final void Function()? onTap;
  final void Function()? onDismissed;

  const AssignmentTile({
    required this.assignment,
    this.onTap,
    this.onDismissed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DismissibleTile(
      key: ValueKey(assignment),
      action: DismissibleAction.actionComplete,
      onDismissed: (_) => onDismissed?.call(),
      child: ListTile(
        key: ValueKey(assignment.id),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: FormLayout.textSpacing,
          children: [
            Flexible(
              child: Text(
                assignment.subject,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            context.textMedium(DateHelper.formatDatePretty(assignment.date)),
          ],
        ),
        subtitle: Text(
          assignment.text,
          maxLines: 3,
        ),
        leadingAndTrailingTextStyle: Theme.of(context).textTheme.bodyMedium,
        onTap: () => onTap?.call(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/shared/shared.dart';

class AssignmentTile extends StatelessWidget {
  final Assignment assignment;
  final List<Label> labels;
  final String? deleteTitle;
  final String? deletePrompt;
  final int maxLines;
  final VoidCallback? onTap;
  final VoidCallback? onComplete;
  final VoidCallback? onArchive;

  const AssignmentTile({
    super.key,
    required this.assignment,
    required this.labels,
    this.deleteTitle,
    this.deletePrompt,
    this.maxLines = 5,
    this.onTap,
    this.onComplete,
    this.onArchive,
  });

  @override
  Widget build(BuildContext context) {
    return DismissibleTile(
      uniqueKey: ValueKey(assignment),
      action: DismissibleAction.positive,
      secondaryAction: DismissibleAction.negative,
      icon: Symbols.done_outline,
      secondaryIcon: Symbols.archive,
      secondaryPromptTitle: deleteTitle,
      secondaryPromptText: deletePrompt,
      onAction: onComplete,
      onSecondaryAction: onArchive,
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final assignmentText = AssignmentText(
      assignment: assignment,
      labels: labels,
      maxLines: maxLines,
    );

    return ListTile(
      title: Row(
        mainAxisAlignment: .spaceBetween,
        spacing: FormLayout.textSpacing,
        children: [
          Flexible(
            child: assignment.subject.isEmpty
                ? assignmentText
                : Text(
                    assignment.subject,
                    overflow: .ellipsis,
                  ),
          ),
          context.textMedium(assignment.date.formatUntil()),
        ],
      ),
      subtitle: assignment.subject.isNotEmpty ? assignmentText : null,
      onTap: onTap,
    );
  }
}

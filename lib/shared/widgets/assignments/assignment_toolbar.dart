import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/shared/shared.dart';

class AssignmentToolbar extends StatelessWidget {
  static const iconSize = 20.0;
  static const iconPadding = EdgeInsets.all(4);
  static const rowPadding = EdgeInsets.all(8);

  final List<UserAction> actions;
  final List<Label> labels;
  final String dialogTitle;
  final bool? isCompleted;
  final Function(UserAction, String?)? onAction;
  final VoidCallback onComplete;

  const AssignmentToolbar({
    required this.actions,
    required this.labels,
    required this.dialogTitle,
    required this.isCompleted,
    required this.onAction,
    required this.onComplete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: rowPadding,
      child: Row(
        children: [
          _buildLabels(),
          TapIcon(
            icon: Icons.add_outlined,
            onTap: () => _showActionMenu(),
          ),
          if (isCompleted != null)
            TapIcon(
              icon: isCompleted! ? Icons.check_box_outlined : Icons.check_box_outline_blank,
              onTap: onComplete,
            ),
        ],
      ),
    );
  }

  Widget _buildLabels() {
    return Expanded(
      child: Padding(
        padding: iconPadding,
        child: LabelBar(
          labels: labels,
          onTap: (value) => onAction?.call(UserAction.addLabel, value),
        ),
      ),
    );
  }

  void _showActionMenu() {
    showModalDialog<UserAction>(
      builder: (_) => ActionDialog(
        title: dialogTitle,
        values: actions,
        iconBuilder: (value) => ActionIcon(action: value),
        textBuilder: (value) => value.tr(),
      ),
      onSaved: (value) => onAction?.call(value, null),
    );
  }
}

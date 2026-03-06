import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/shared/shared.dart';

class LabelBar extends StatelessWidget {
  final List<Label> labels;
  final void Function(String)? onTap;

  const LabelBar({
    required this.labels,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: FormLayout.iconSpacing,
      runSpacing: FormLayout.iconSpacing + FormLayout.lineSpacing,
      children: labels
          .map(
            (label) => LabelButton(
              name: label.name,
              color: label.color,
              onTap: onTap != null ? () => onTap?.call(label.name) : null,
            ),
          )
          .toList(),
    );
  }
}

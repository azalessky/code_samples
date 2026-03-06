import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';

class ScheduleCell extends StatelessWidget {
  final EdgeInsets padding;
  final AlignmentGeometry alignment;
  final Widget? child;
  final VoidCallback? onTap;

  const ScheduleCell({
    super.key,
    this.padding = FormLayout.textPadding,
    this.alignment = .center,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Align(
          alignment: alignment,
          child: child,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';

class LabelIcon extends StatelessWidget {
  final Color? color;

  const LabelIcon({
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fillColor = color == null
        ? Theme.of(context).colorScheme.onSurface
        : Themes.alpha(context, color!, FormStyles.iconAlpha);

    return Container(
      width: 18,
      height: 18,
      margin: .all(4),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(FormStyles.iconRadius),
        border: Border.all(color: fillColor),
      ),
    );
  }
}

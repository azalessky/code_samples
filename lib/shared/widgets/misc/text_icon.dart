import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';

class TextIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final double? weight;

  const TextIcon(
    this.icon, {
    this.size,
    this.weight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: context.textColor,
      weight: weight,
    );
  }
}

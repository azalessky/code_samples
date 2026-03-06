import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';

class AppIcon extends StatelessWidget {
  final double size;

  const AppIcon({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ResourceSettings.androidIcon,
      width: size,
      height: size,
      opacity: const AlwaysStoppedAnimation(FormStyles.iconAlpha),
    );
  }
}

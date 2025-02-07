import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/helpers/helpers.dart';

class SpacePlaceholder extends StatelessWidget {
  final String text;

  const SpacePlaceholder({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final lines = text.split('\n');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          context.titleMedium(lines[0]),
          if (lines.length > 1) FormLayout.fieldSpacer,
          if (lines.length > 1) context.textMedium(lines[1]),
        ],
      ),
    );
  }
}

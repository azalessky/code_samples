import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class SpacePlaceholder extends StatelessWidget {
  static const iconSize = 52.0;
  static const compactIconSize = 36.0;
  static const iconWeight = 100.0;

  final IconData? icon;
  final String text;
  final bool compact;

  const SpacePlaceholder({
    this.icon,
    required this.text,
    this.compact = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final lines = text.split('\n');

    final titleSmall = context.textTheme.titleSmall!;
    final titleMedium = context.textTheme.titleMedium!;

    return Padding(
      padding: FormLayout.formPadding,
      child: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            if (icon != null)
              TextIcon(
                icon!,
                size: compact ? compactIconSize : iconSize,
                weight: iconWeight,
              ),
            Text(
              lines[0],
              style: compact ? titleSmall : titleMedium,
              textAlign: .center,
            ),
            if (lines.length > 1) ...[
              FormLayout.fieldSpacer,
              Text(
                lines[1],
                style: titleSmall,
                textAlign: .center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

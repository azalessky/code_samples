import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';

class LabelButton extends StatelessWidget {
  static const padding = EdgeInsets.fromLTRB(9, 2, 9, 3);

  final String name;
  final Color color;
  final void Function()? onTap;

  const LabelButton({
    required this.name,
    required this.color,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (name.isEmpty) return const SizedBox.shrink();

    final backgroundColor = Themes.alpha(context, color, FormStyles.labelAlpha);
    final borderRadius = BorderRadius.circular(FormStyles.labelRadius);

    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
      child: Padding(
        padding: padding,
        child: Text(
          name,
          softWrap: false,
          style: context.textTheme.bodySmall,
        ),
      ),
    );
  }
}

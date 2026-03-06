import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

class GradeText extends StatelessWidget {
  static const padding = EdgeInsets.symmetric(horizontal: 8, vertical: 2);

  final GradesConfig config;
  final Grade grade;

  const GradeText({
    super.key,
    required this.config,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    final gradeColor = GradesHelper(config).gradeColor(grade);
    final color = Themes.alpha(context, gradeColor, FormStyles.gradeAlpha);
    final textStyle = context.textTheme.titleSmall;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(FormStyles.gradeRadius),
        border: Border.all(color: color),
      ),
      child: Text(
        GradesHelper(config).gradeText(grade),
        textAlign: .center,
        style: textStyle,
      ),
    );
  }
}

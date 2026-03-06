import 'package:flutter/material.dart';
import 'package:student_planner/common/common.dart';

import 'package:student_planner/models/models.dart';
import 'package:student_planner/features/schedule/schedule.dart';
import 'package:student_planner/shared/shared.dart';

class LessonCell extends StatelessWidget {
  final Period? period;
  final Assignment? assignment;
  final List<Label> labels;
  final EdgeInsets padding;
  final int maxLines;
  final VoidCallback? onTap;

  const LessonCell({
    super.key,
    required this.period,
    required this.assignment,
    required this.labels,
    required this.padding,
    this.maxLines = 3,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final children = _buildColumn(context);
    final placeholder = Text('', style: context.textTheme.bodyLarge);

    return ScheduleCell(
      padding: padding,
      alignment: .centerLeft,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: .start,
        children: children.isEmpty ? [placeholder] : children,
      ),
    );
  }

  List<Widget> _buildColumn(BuildContext context) {
    final subject = [
      if (period?.subject.isNotEmpty == true)
        Expanded(
          child: Text(
            period!.subject,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyLarge,
          ),
        ),
      if (period?.room.isNotEmpty == true) ...[
        if (period?.subject.isNotEmpty != true) Spacer(),
        context.textMedium(period!.room),
      ],
    ];

    final lesson = [
      if (subject.isNotEmpty)
        Row(
          spacing: FormLayout.textSpacing,
          children: subject,
        ),
      if (period?.topic.isNotEmpty == true)
        Text(
          period!.topic,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ),
    ];

    final hasDivider =
        period?.topic.isNotEmpty == true &&
        (assignment?.content.isNotEmpty == true || assignment?.images.isNotEmpty == true);

    return [
      ...lesson,
      if (assignment?.isNotEmpty == true) ...[
        if (hasDivider) FormLayout.tinySpacer,
        AssignmentText(
          assignment: assignment!,
          labels: labels,
          maxLines: maxLines,
        ),
      ],
    ];
  }
}

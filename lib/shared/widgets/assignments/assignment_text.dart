import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/shared/shared.dart';

class AssignmentText extends StatelessWidget {
  static const iconSize = 16.0;

  final Assignment assignment;
  final List<Label> labels;
  final int maxLines;

  const AssignmentText({
    required this.assignment,
    required this.labels,
    required this.maxLines,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final content = _buildContent(context, assignment);

    return Column(
      crossAxisAlignment: .start,
      children: [
        if (content != null)
          Row(
            spacing: FormLayout.iconSpacing,
            children: [
              content,
              if (assignment.completed) TextIcon(Symbols.check, size: iconSize),
            ],
          ),
        if (labels.isNotEmpty)
          Padding(
            padding: .symmetric(vertical: FormLayout.iconSpacing),
            child: LabelBar(labels: labels),
          ),
      ],
    );
  }

  Widget? _buildContent(BuildContext context, Assignment assignment) {
    final hasImages = assignment.content.isEmpty && assignment.images.isNotEmpty;
    final isList = assignment.content is ListContent;

    final spans = hasImages
        ? [_buildIconSpan(Symbols.image, true)]
        : assignment.content.when(
            text: (text) => _buildTextSpan(text),
            list: (items) => _buildListSpan(items),
          );
    if (spans.isEmpty) return null;

    final lines = spans
        .map(
          (span) => RichText(
            maxLines: isList ? 1 : maxLines,
            softWrap: false,
            overflow: .ellipsis,
            text: TextSpan(
              style: context.textTheme.bodyMedium,
              children: [span],
            ),
          ),
        )
        .take(isList ? maxLines : 1)
        .toList();

    return Expanded(
      child: Column(
        crossAxisAlignment: .start,
        children: lines,
      ),
    );
  }

  WidgetSpan _buildIconSpan(IconData icon, bool leading) {
    return WidgetSpan(
      alignment: .middle,
      child: Padding(
        padding: .only(
          left: leading ? 0 : FormLayout.iconSpacing,
          right: leading ? FormLayout.iconSpacing : 0,
        ),
        child: TextIcon(icon, size: iconSize),
      ),
    );
  }

  List<TextSpan> _buildTextSpan(String text) {
    return text.isNotEmpty ? [TextSpan(text: text)] : [];
  }

  List<TextSpan> _buildListSpan(List<CheckItem> items) {
    return items.map((item) {
      final icon = item.checked ? Symbols.check : Symbols.check_box_outline_blank;
      final text = item.text + (item != items.last ? '\n' : '');

      return TextSpan(
        children: [
          _buildIconSpan(icon, true),
          TextSpan(text: text),
        ],
      );
    }).toList();
  }
}

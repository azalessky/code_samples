import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class ColorPickerDialog extends StatelessWidget {
  final String? title;
  final List<Color> values;
  final Color initialValue;

  const ColorPickerDialog({
    this.title,
    required this.values,
    required this.initialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: title,
      titlePadding: DialogPaddings.dialogTitle,
      contentPadding: DialogPaddings.pickerContent,
      contentBuilder: _buildContent,
    );
  }

  Widget _buildContent(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: 208,
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: .center,
          children: values.map((value) => _buildColorCircle(context, value)).toList(),
        ),
      ),
    );
  }

  Widget _buildColorCircle(BuildContext context, Color color) {
    return SizedBox.square(
      dimension: 40,
      child: ShapedInkWell(
        shape: const CircleBorder(),
        onTap: () => context.maybePop(color),
        child: ColoredBox(
          color: color,
          child: color == initialValue ? _buildCheckIcon(color) : null,
        ),
      ),
    );
  }

  Widget _buildCheckIcon(Color color) {
    return Icon(
      Icons.done,
      size: 28,
      color: ThemeData.estimateBrightnessForColor(color) == Brightness.light
          ? Colors.black
          : Colors.white,
    );
  }
}

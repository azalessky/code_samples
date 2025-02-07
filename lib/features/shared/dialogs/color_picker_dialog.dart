import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/features/shared/shared.dart';

class ColorPickerDialog extends StatefulWidget {
  final String title;
  final List<Color> values;
  final Color initialValue;
  final void Function(Color) onChanged;

  const ColorPickerDialog({
    required this.title,
    required this.values,
    required this.initialValue,
    required this.onChanged,
    super.key,
  });

  @override
  State<ColorPickerDialog> createState() => _ColorPickerDialogState();
}

class _ColorPickerDialogState extends State<ColorPickerDialog> {
  late Color selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: widget.title,
      contentPadding: DialogPaddings.pickerContent,
      contentBuilder: _buildContent,
      actions: [
        DialogActionButton(
          title: 'Button.Save'.tr(),
          onPressed: () => context.maybePop(selectedValue),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: List.generate(
          widget.values.length,
          (index) => GestureDetector(
            onTap: () => _circleTapHandler(widget.values[index]),
            child: _buildColorCircle(widget.values[index]),
          ),
        ),
      ),
    );
  }

  Widget _buildColorCircle(Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: color == selectedValue ? _buildCheckIcon(color) : null,
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

  void _circleTapHandler(Color color) {
    widget.onChanged(color);
    setState(() => selectedValue = color);
  }
}

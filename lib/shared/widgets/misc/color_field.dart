import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class ColorField extends StatelessWidget {
  final Color initialValue;
  final String? hintText;
  final String? errorText;
  final String? dialogTitle;
  final void Function(Color)? onSaved;

  const ColorField({
    required this.initialValue,
    this.hintText,
    this.errorText,
    this.dialogTitle,
    this.onSaved,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<Color>(
      initialValue: initialValue,
      builder: (state) => TextFormField(
        key: ValueKey(state.value),
        initialValue: Palette.nameOf(state.value!),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIconConstraints: const BoxConstraints(
            maxWidth: 40,
            maxHeight: 24,
          ),
          suffixIcon: _buildSuffixIcon(state.value),
        ),
        readOnly: true,
        validator: TextRequiredValidator(errorText ?? '').validate,
        onTap: () async {
          final value = await _showColorPicker(context, state.value ?? initialValue);
          if (value != null) state.didChange(value);
        },
      ),
      onSaved: (value) => onSaved?.call(value!),
    );
  }

  Widget _buildSuffixIcon(Color? color) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 8, end: 12),
      child: color != null
          ? Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            )
          : Icon(Icons.arrow_drop_down),
    );
  }

  Future<Color?> _showColorPicker(BuildContext context, Color value) {
    return showModalDialog<Color>(
      builder: (_) => ColorPickerDialog(
        title: dialogTitle,
        values: Palette.colors,
        initialValue: value,
      ),
    );
  }
}

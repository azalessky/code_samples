import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:student_planner/shared/shared.dart';

class SelectTextField extends StatelessWidget {
  final String initialValue;
  final List<String> values;
  final String hintText;
  final String dialogTitle;
  final int maxLength;
  final TextCapitalization textCapitalization;
  final void Function(String value) onSaved;

  const SelectTextField({
    super.key,
    required this.initialValue,
    required this.values,
    required this.hintText,
    required this.dialogTitle,
    required this.maxLength,
    required this.textCapitalization,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: ValueKey(initialValue),
      initialValue: initialValue,
      inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: values.isNotEmpty
            ? IconButton(
                onPressed: () => _selectValue(context),
                icon: const DropDownIcon(),
              )
            : null,
      ),
      onSaved: (value) => onSaved(value ?? ''),
    );
  }

  void _selectValue(BuildContext context) {
    showModalDialog<String>(
      builder: (_) => ValueListDialog(
        title: dialogTitle,
        values: values,
        initialValue: initialValue,
        textBuilder: (value) => value,
      ),
      onSaved: (value) => onSaved(value),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/features/shared/shared.dart';

class DropDownField<T extends Object> extends StatelessWidget {
  final T? initialValue;
  final List<T> values;
  final String? hintText;
  final String? errorText;
  final String Function(T) textBuilder;
  final void Function(T)? onSaved;

  const DropDownField({
    this.initialValue,
    required this.values,
    this.hintText,
    this.errorText,
    required this.textBuilder,
    this.onSaved,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      initialValue: initialValue,
      builder: (state) => TextFormField(
        key: ValueKey(state.value),
        initialValue: state.value != null ? textBuilder(state.value!) : '',
        readOnly: true,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 24),
        ),
        validator: TextRequiredValidator(errorText ?? '').validate,
        onTap: () => showModalDialog<T>(
          context: context,
          builder: (_) => ValueListDialog<T>(
            values: values,
            textBuilder: textBuilder,
            initialValue: state.value,
          ),
          onSaved: (value) => state.didChange(value),
        ),
        onSaved: (value) => onSaved?.call(state.value!),
      ),
    );
  }
}

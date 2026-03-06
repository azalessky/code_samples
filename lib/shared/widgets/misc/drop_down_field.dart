import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class DropDownField<T extends Object> extends StatelessWidget {
  final T? initialValue;
  final List<T> values;
  final String? hintText;
  final String? errorText;
  final String? dialogTitle;
  final bool enabled;
  final bool clearButton;
  final String Function(T) textBuilder;
  final Widget Function(T)? iconBuilder;
  final void Function(T?)? onChanged;
  final void Function(T?)? onSaved;

  const DropDownField({
    this.initialValue,
    required this.values,
    this.hintText,
    this.errorText,
    this.dialogTitle,
    this.enabled = true,
    this.clearButton = false,
    required this.textBuilder,
    this.iconBuilder,
    this.onChanged,
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
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
          suffixIcon: const DropDownIcon(),
        ),
        validator: clearButton ? null : TextRequiredValidator(errorText ?? '').validate,
        onTap: () => showModalDialog<T>(
          builder: (_) => ValueListDialog<T>(
            values: values,
            initialValue: state.value,
            title: dialogTitle,
            clearTitle: clearButton ? t.button.delete : null,
            textBuilder: textBuilder,
            iconBuilder: iconBuilder,
            onSelected: (value) {
              state.didChange(value);
              onChanged?.call(value);
            },
          ),
        ),
        onSaved: (value) => onSaved?.call(state.value),
      ),
    );
  }
}

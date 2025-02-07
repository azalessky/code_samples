import 'package:flutter/material.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:intl/intl.dart';

class DateTimeField extends StatelessWidget {
  final DateTime? initialValue;
  final DateTime minValue;
  final DateTime maxValue;
  final String? hintText;
  final String? errorText;
  final void Function(DateTime?)? onChanged;
  final void Function(DateTime?)? onSaved;

  const DateTimeField({
    this.initialValue,
    required this.minValue,
    required this.maxValue,
    this.hintText,
    this.errorText,
    this.onChanged,
    this.onSaved,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      initialValue: initialValue,
      builder: (state) => TextFormField(
          key: ValueKey(state.value),
          initialValue: state.value != null ? DateFormat.yMMMMd().format(state.value!) : null,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIconConstraints: const BoxConstraints(
              maxWidth: 32,
              maxHeight: 32,
            ),
            suffixIcon: const Padding(
              padding: EdgeInsetsDirectional.only(end: 12),
              child: Icon(Icons.arrow_drop_down, size: 24),
            ),
          ),
          readOnly: true,
          validator: TextRequiredValidator(errorText ?? '').validate,
          onTap: () async {
            final date = await _showDatePicker(context, state.value ?? initialValue);
            if (date != null) {
              state.didChange(date);
              onChanged?.call(date);
            }
          }),
      onSaved: (value) => onSaved?.call(value),
    );
  }

  Future<DateTime?> _showDatePicker(BuildContext context, DateTime? value) {
    return showDatePicker(
      context: context,
      initialDate: value ?? _calcInitialDate(minValue, maxValue),
      firstDate: minValue,
      lastDate: maxValue,
    );
  }

  DateTime _calcInitialDate(DateTime min, DateTime max) {
    final today = DateUtils.dateOnly(DateTime.now());
    return today.isBefore(min)
        ? min
        : today.isAfter(max)
            ? max
            : today;
  }
}

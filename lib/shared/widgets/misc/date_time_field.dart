import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class DateTimeField extends StatefulWidget {
  final DateTime? initialValue;
  final DateTime minValue;
  final DateTime maxValue;
  final String? hintText;
  final String? errorText;
  final ValueChanged<DateTime?>? onChanged;
  final ValueChanged<DateTime?>? onSaved;

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
  State<DateTimeField> createState() => _DateTimeFieldState();
}

class _DateTimeFieldState extends State<DateTimeField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      initialValue: widget.initialValue,
      builder: (state) => TextFormField(
        key: ValueKey(state.value),
        initialValue: state.value?.format(DateFormat.YEAR_MONTH_DAY),
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIconConstraints: const BoxConstraints(
            maxWidth: 32,
            maxHeight: 32,
          ),
          suffixIcon: const Padding(
            padding: EdgeInsetsDirectional.only(end: 12),
            child: DropDownIcon(),
          ),
        ),
        readOnly: true,
        focusNode: _focusNode,
        validator: TextRequiredValidator(widget.errorText ?? '').validate,
        onTap: () async {
          final value = await _showDatePicker(context, state.value ?? widget.initialValue);
          if (value != null) {
            _focusNode.requestFocus();
            state.didChange(value);
            widget.onChanged?.call(value);
          }
        },
      ),
      onSaved: (value) => widget.onSaved?.call(value),
    );
  }

  Future<DateTime?> _showDatePicker(BuildContext context, DateTime? value) {
    return showDatePicker(
      context: context,
      initialDate: value ?? _calcInitialDate(widget.minValue, widget.maxValue),
      firstDate: widget.minValue,
      lastDate: widget.maxValue,
    );
  }

  DateTime _calcInitialDate(DateTime min, DateTime max) {
    final today = DateHelper.todayUtc;
    return today.isBefore(min)
        ? min
        : today.isAfterDay(max)
        ? max
        : today;
  }
}

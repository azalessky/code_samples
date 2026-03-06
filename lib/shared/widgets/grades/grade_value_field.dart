import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

class CommaToDotFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(',', '.');
    return newValue.copyWith(
      text: newText,
      selection: newValue.selection,
    );
  }
}

class GradeValueField extends StatefulWidget {
  final GradeValue? initialValue;
  final GradesConfig config;
  final String hintTextValue;
  final String hintTextWeight;
  final bool autofocus;
  final bool editWeight;
  final void Function(GradeValue)? onSaved;

  const GradeValueField({
    this.initialValue,
    required this.config,
    required this.hintTextValue,
    required this.hintTextWeight,
    this.autofocus = false,
    this.editWeight = true,
    this.onSaved,
    super.key,
  });

  @override
  State<GradeValueField> createState() => _GradeValueFieldState();
}

class _GradeValueFieldState extends State<GradeValueField> {
  late TextEditingController _valueController;
  late TextEditingController _weightController;

  @override
  void initState() {
    super.initState();

    final weight = widget.initialValue?.weight;
    final weightText = (weight == null || weight == 0) ? '' : weight.toString();

    _valueController = TextEditingController(text: widget.initialValue?.value);
    _weightController = TextEditingController(text: weightText);
  }

  @override
  void dispose() {
    _valueController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<GradeValue>(
      initialValue: widget.initialValue,
      builder: (state) => Row(
        spacing: FormLayout.fieldSpacing,
        children: [
          _buildValueField(context),
          if (widget.editWeight) _buildWeightField(),
        ],
      ),
      onSaved: (_) => widget.onSaved?.call(_returnValue()),
    );
  }

  GradeValue _returnValue() {
    return GradeValue(
      value: _valueController.text,
      weight: double.tryParse(_weightController.text) ?? 0,
    );
  }

  Widget _buildValueField(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: _valueController,
        autofocus: widget.autofocus,
        inputFormatters: [LengthLimitingTextInputFormatter(FieldConstraints.gradeValueLength)],
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(hintText: widget.hintTextValue),
        validator: TextRequiredValidator().validate,
      ),
    );
  }

  Widget _buildWeightField() {
    return Expanded(
      child: TextFormField(
        controller: _weightController,
        inputFormatters: [
          CommaToDotFormatter(),
          LengthLimitingTextInputFormatter(FieldConstraints.gradeValueLength),
        ],
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          hintText: widget.hintTextWeight,
        ),
        validator: DoubleRequiredValidator(true).validate,
      ),
    );
  }
}

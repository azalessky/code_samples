import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_planner/helpers/validator_helper.dart';
import 'package:material_symbols_icons/symbols.dart';

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

class GradeValueField extends StatelessWidget {
  final GradeValue? initialValue;
  final GradingScale gradingScale;
  final String hintTextValue;
  final String hintTextWeight;
  final String errorText;
  final bool autofocus;
  final void Function(GradeValue)? onSaved;

  const GradeValueField({
    this.initialValue,
    required this.gradingScale,
    required this.hintTextValue,
    required this.hintTextWeight,
    required this.errorText,
    this.autofocus = false,
    this.onSaved,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<GradeValue>(
      initialValue: initialValue,
      builder: (state) {
        final weight = state.value?.weight;
        final weightText = (weight == null || weight == 0) ? '' : weight.toString();

        return Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: state.value?.value,
                autofocus: autofocus,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(FieldConstraints.gradeValueLength)
                ],
                textCapitalization: gradingScale == GradingScale.numeric
                    ? TextCapitalization.none
                    : TextCapitalization.characters,
                keyboardType:
                    gradingScale == GradingScale.numeric ? TextInputType.phone : TextInputType.text,
                decoration: InputDecoration(
                  hintText: hintTextValue,
                  prefixIcon: Icon(Symbols.star),
                ),
                validator: TextRequiredValidator().validate,
                onChanged: (value) => state.didChange(
                  state.value!.copyWith(value: value),
                ),
              ),
            ),
            FormLayout.fieldSpacer,
            Expanded(
              child: TextFormField(
                initialValue: weightText,
                inputFormatters: [
                  CommaToDotFormatter(),
                  LengthLimitingTextInputFormatter(FieldConstraints.gradeValueLength)
                ],
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: hintTextWeight,
                  prefixIcon: Icon(Symbols.weight),
                ),
                validator: DoubleRequiredValidator(true).validate,
                onChanged: (value) => state.didChange(
                  state.value!.copyWith(weight: double.tryParse(value) ?? 0),
                ),
              ),
            ),
          ],
        );
      },
      onSaved: (value) => onSaved?.call(value!),
    );
  }
}

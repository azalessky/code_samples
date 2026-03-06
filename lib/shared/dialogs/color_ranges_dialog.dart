import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/shared/shared.dart';

class MinIntFormatter extends TextInputFormatter {
  final int min;

  const MinIntFormatter({this.min = 1});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;

    final number = int.tryParse(text);
    return (number != null && number >= min) ? newValue : oldValue;
  }
}

class ColorRangesDialog extends StatefulWidget {
  final List<ColorRange> initialValue;
  final String title;
  final String dialogTitle;
  final String otherLabel;

  const ColorRangesDialog({
    super.key,
    required this.initialValue,
    required this.title,
    required this.dialogTitle,
    required this.otherLabel,
  });

  @override
  State<ColorRangesDialog> createState() => _ColorRangesDialogState();
}

class _ColorRangesDialogState extends State<ColorRangesDialog> {
  final _formKey = GlobalKey<FormState>();
  late List<ColorRange> _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = List.of(widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: widget.title,
      titlePadding: DialogPaddings.dialogTitle,
      contentPadding: DialogPaddings.inputContent,
      contentBuilder: (context) => Form(
        key: _formKey,
        child: Column(
          spacing: FormLayout.inputSpacing,
          children: List.generate(_selectedValue.length, (index) => _buildRow(index)),
        ),
      ),
      actions: [
        DialogActionButton.submit(
          formKey: _formKey,
          context: context,
          title: t.button.save,
          returnValue: () => _selectedValue.sorted((a, b) => b.from.compareTo(a.from)),
        ),
      ],
    );
  }

  Widget _buildRow(int index) {
    final range = _selectedValue[index];

    return Row(
      children: [
        Flexible(
          child: (range.from > 0 && range.to > 0)
              ? Row(
                  children: [
                    Flexible(child: _buildTextField(index, true)),
                    FormLayout.smallSpacer,
                    TextIcon(Symbols.remove, size: 16),
                    FormLayout.smallSpacer,
                    Flexible(child: _buildTextField(index, false)),
                  ],
                )
              : Align(
                  alignment: .centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: FormLayout.textSpacing),
                    child: context.textLarge(widget.otherLabel),
                  ),
                ),
        ),
        FormLayout.inputSpacer,
        Flexible(
          child: ColorField(
            initialValue: range.color,
            dialogTitle: widget.dialogTitle,
            onSaved: (value) => _updateRange(index, null, null, value),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(int index, bool left) {
    final range = _selectedValue[index];
    final value = left ? range.from.toString() : range.to.toString();

    return TextFormField(
      initialValue: value,
      keyboardType: TextInputType.numberWithOptions(decimal: false),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        MinIntFormatter(min: 1),
      ],
      onChanged: (value) => _updateRange(index, left ? value : null, left ? null : value, null),
    );
  }

  void _updateRange(int index, String? from, String? to, Color? color) {
    final range = _selectedValue[index];
    _selectedValue[index] = (
      from: int.tryParse(from ?? '') ?? range.from,
      to: int.tryParse(to ?? '') ?? range.to,
      color: color ?? range.color,
    );
  }
}

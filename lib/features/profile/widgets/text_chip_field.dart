import 'package:flutter/material.dart';
import 'package:student_planner/common/common.dart';

import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/features/shared/shared.dart';

class TextChipField extends StatefulWidget {
  static const iconSize = 24.0;

  final List<String>? initialValue;
  final List<String> values;
  final String? hintText;
  final String? errorText;
  final void Function(List<String>)? onSaved;

  const TextChipField({
    this.initialValue,
    required this.values,
    this.hintText,
    this.errorText,
    this.onSaved,
    super.key,
  });

  @override
  State<TextChipField> createState() => _TextChipFieldState();
}

class _TextChipFieldState extends State<TextChipField> {
  late List<String> selectedValues;

  @override
  void initState() {
    super.initState();
    selectedValues = List.of(widget.initialValue ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        hintText: selectedValues.isEmpty ? widget.hintText : null,
        border: const OutlineInputBorder(),
        prefixIcon: selectedValues.isNotEmpty ? _buildChips(selectedValues) : null,
        suffixIcon: const Icon(Icons.arrow_drop_down, size: TextChipField.iconSize),
      ),
      validator: (_) => selectedValues.isEmpty ? (widget.errorText ?? '') : null,
      onTap: () => showModalDialog<String>(
        context: context,
        builder: (_) => ValueListDialog(
          values: widget.values.excludeList(selectedValues),
          textBuilder: (value) => value,
        ),
        onSaved: (value) => _addValue(value),
      ),
      onSaved: (value) => widget.onSaved?.call(selectedValues),
    );
  }

  Widget _buildChips(List<String> values) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final wrapWidth = constraints.maxWidth - TextChipField.iconSize * 2;
        return Container(
          width: wrapWidth,
          padding: FormLayout.chipPadding.copyWith(left: 0, right: 0),
          child: Wrap(
            children: values.map((value) => _buildChip(value)).toList(),
          ),
        );
      },
    );
  }

  Widget _buildChip(String value) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: InputChip(
        label: context.textLarge(value),
        labelPadding: FormLayout.chipPadding.copyWith(top: 0, bottom: 0),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent),
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onDeleted: () => _removeValue(value),
      ),
    );
  }

  void _addValue(String value) {
    setState(() {
      selectedValues.add(value);
      selectedValues.sort();
    });
  }

  void _removeValue(String value) {
    setState(() => selectedValues.remove(value));
  }
}

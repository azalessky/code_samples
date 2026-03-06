import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class InputListDialog extends StatefulWidget {
  final String title;
  final List<num> initialValue;
  final String Function(int) labelBuilder;
  final String? Function(int, num)? validator;

  const InputListDialog({
    required this.title,
    required this.initialValue,
    required this.labelBuilder,
    this.validator,
    super.key,
  });

  @override
  State<InputListDialog> createState() => _InputListDialogState();
}

class _InputListDialogState extends State<InputListDialog> {
  final _formKey = GlobalKey<FormState>();
  late List<num> _selectedValue;

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
          children: _selectedValue
              .mapIndexed(
                (index, value) => _buildRow(index, value),
              )
              .toList(),
        ),
      ),
      actions: [
        DialogActionButton.submit(
          formKey: _formKey,
          context: context,
          title: t.button.save,
          returnValue: () => _selectedValue,
        ),
      ],
    );
  }

  Widget _buildRow(int index, num value) {
    return Row(
      children: [
        Expanded(
          child: context.textLarge(
            widget.labelBuilder(index),
          ),
        ),
        Expanded(
          child: TextFormField(
            initialValue: value.toString(),
            keyboardType: TextInputType.number,
            validator: (text) {
              final parsed = _parseText(value.runtimeType, text!);
              if (parsed == null) return '';

              return widget.validator?.call(index, parsed);
            },
            onSaved: (text) {
              final parsed = _parseText(value.runtimeType, text!);
              if (parsed != null) {
                _selectedValue[index] = parsed;
              }
            },
          ),
        ),
      ],
    );
  }

  num? _parseText(Type type, String text) {
    if (type == int) {
      return int.tryParse(text);
    } else if (type == double) {
      return double.tryParse(text);
    } else {
      return null;
    }
  }
}

import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class ObjectListField<T> extends StatefulWidget {
  final List<T>? initialValue;
  final String? hintText;
  final String? errorText;
  final String Function(T) textBuilder;
  final Future<T?> Function(List<T>) addItem;
  final void Function(List<T>)? onSaved;

  const ObjectListField({
    this.initialValue,
    this.hintText,
    this.errorText,
    required this.textBuilder,
    required this.addItem,
    this.onSaved,
    super.key,
  });

  @override
  State<ObjectListField> createState() => _ObjectListFieldState<T>();
}

class _ObjectListFieldState<T> extends State<ObjectListField<T>> {
  late final List<T> _selectedValue;
  final _fieldKey = GlobalKey<FormFieldState<String>>();

  @override
  void initState() {
    super.initState();
    _selectedValue = List.of(widget.initialValue ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _fieldKey,
      readOnly: true,
      decoration: InputDecoration(
        hintText: _selectedValue.isEmpty ? widget.hintText : null,
        border: const OutlineInputBorder(),
        prefixIcon: _selectedValue.isNotEmpty ? _buildChipList(_selectedValue) : null,
        suffixIcon: const DropDownIcon(),
        errorText: _fieldKey.currentState?.errorText,
      ),
      onTap: _addItemHandler,
      validator: (_) => _selectedValue.isEmpty ? (widget.errorText ?? '') : null,
      onSaved: (_) => widget.onSaved?.call(_selectedValue),
    );
  }

  Widget _buildChipList(List<T> values) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final wrapWidth = constraints.maxWidth - DropDownIcon.iconSize * 2;
        return Container(
          width: wrapWidth,
          padding: FormLayout.chipPadding.copyWith(left: 0, right: 0),
          child: Wrap(
            children: values.map(_buildChip).toList(),
          ),
        );
      },
    );
  }

  Widget _buildChip(T value) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: InputChip(
        label: context.textLarge(widget.textBuilder(value)),
        labelPadding: FormLayout.chipPadding.copyWith(top: 0, bottom: 0),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent),
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onDeleted: () => _removeItemHandler(value),
      ),
    );
  }

  Future<void> _addItemHandler() async {
    final item = await widget.addItem(_selectedValue);
    if (item != null) {
      setState(() {
        _selectedValue.add(item);
        _selectedValue.sort();
      });
      _fieldKey.currentState?.validate();
    }
  }

  void _removeItemHandler(T value) {
    setState(() => _selectedValue.remove(value));
    _fieldKey.currentState?.validate();
  }
}

import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class ObjectListDialog<T> extends StatefulWidget {
  final String? title;
  final String? inputTitle;
  final String? inputHintText;
  final List<T> initialValue;
  final int? maxLength;
  final String Function(T) textBuilder;
  final T Function(String) objectBuilder;

  const ObjectListDialog({
    this.title,
    this.inputTitle,
    this.inputHintText,
    required this.initialValue,
    this.maxLength,
    required this.textBuilder,
    required this.objectBuilder,
    super.key,
  });

  @override
  State<ObjectListDialog<T>> createState() => _ObjectListDialogState<T>();
}

class _ObjectListDialogState<T> extends State<ObjectListDialog<T>> {
  final _formKey = GlobalKey<FormState>();
  late List<T> _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = List.from(widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: widget.title,
      titlePadding: DialogPaddings.dialogTitle,
      contentPadding: DialogPaddings.inputContent,
      contentBuilder: (_) => _buildContent(),
      actions: _buildActionButtons(context),
    );
  }

  Widget _buildContent() {
    return Form(
      key: _formKey,
      child: ObjectListField(
        initialValue: _selectedValue,
        textBuilder: widget.textBuilder,
        addItem: (_) => _addItemHandler(),
        onSaved: (value) => _selectedValue = value,
      ),
    );
  }

  List<DialogActionButton> _buildActionButtons(BuildContext context) {
    return [
      DialogActionButton.submit<List<T>>(
        formKey: _formKey,
        context: context,
        title: t.button.save,
        returnValue: () => _selectedValue,
      ),
    ];
  }

  Future<T?> _addItemHandler() async {
    final name = await showModalDialog<String>(
      builder: (_) => InputDialog(
        title: widget.inputTitle,
        hintText: widget.inputHintText,
        maxLength: widget.maxLength,
      ),
    );
    return name != null ? widget.objectBuilder(name) : null;
  }
}

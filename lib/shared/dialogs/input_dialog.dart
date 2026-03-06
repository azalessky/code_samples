import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class InputDialog extends StatefulWidget {
  final String? title;
  final String? hintText;
  final String? initialValue;
  final int? maxLength;

  const InputDialog({
    this.title,
    this.hintText,
    this.initialValue,
    this.maxLength,
    super.key,
  });

  @override
  State<InputDialog> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  final _formKey = GlobalKey<FormState>();
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue ?? '';
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
      child: TextFormField(
        initialValue: _selectedValue,
        maxLength: widget.maxLength,
        autofocus: true,
        textCapitalization: .words,
        autovalidateMode: .onUserInteraction,
        decoration: InputDecoration(
          hintText: widget.hintText,
          counterText: '',
        ),
        validator: TextRequiredValidator().validate,
        onSaved: (value) => _selectedValue = value!,
      ),
    );
  }

  List<DialogActionButton> _buildActionButtons(BuildContext context) {
    return [
      DialogActionButton(
        title: t.button.cancel,
        onPressed: () => context.maybePop(),
      ),
      DialogActionButton.submit<String>(
        formKey: _formKey,
        context: context,
        title: t.button.save,
        returnValue: () => _selectedValue,
      ),
    ];
  }
}

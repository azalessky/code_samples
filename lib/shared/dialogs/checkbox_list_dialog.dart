import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class CheckboxListDialog extends StatefulWidget {
  final String title;
  final List<String> items;
  final List<bool> values;
  final bool Function(List<bool>) onValidate;

  const CheckboxListDialog({
    required this.title,
    required this.items,
    required this.values,
    required this.onValidate,
    super.key,
  });

  @override
  State<CheckboxListDialog> createState() => _CheckboxListDialogState();
}

class _CheckboxListDialogState extends State<CheckboxListDialog> {
  late List<bool> _checks;

  @override
  void initState() {
    super.initState();
    _checks = List<bool>.from(widget.values);
  }

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: widget.title,
      titlePadding: DialogPaddings.dialogTitle,
      contentPadding: DialogPaddings.listContent,
      contentBuilder: _buildContent,
      actions: [
        DialogActionButton(
          title: t.button.save,
          onPressed: () => context.maybePop(_checks),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: List.generate(
        _checks.length,
        (index) => CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          value: _checks[index],
          title: Text(widget.items[index].toString()),
          onChanged: (value) => _changeCheckHandler(index, value!),
        ),
      ),
    );
  }

  void _changeCheckHandler(int index, bool value) {
    final checks = List<bool>.from(_checks);
    checks[index] = value;

    if (widget.onValidate(checks)) {
      setState(() => _checks = checks);
    }
  }
}

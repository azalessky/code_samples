import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/features/shared/shared.dart';

import 'grade_value_field.dart';

class GradeInputDialog extends StatefulWidget {
  final List<GradeValue>? initialValue;
  final GradingScale gradingScale;

  const GradeInputDialog({
    this.initialValue,
    required this.gradingScale,
    super.key,
  });

  @override
  State<GradeInputDialog> createState() => _GradeInputDialogState();
}

class _GradeInputDialogState extends State<GradeInputDialog> {
  final formKey = GlobalKey<FormState>();
  late GradeValue value1;
  late GradeValue value2;
  late bool showSecondRow;

  @override
  void initState() {
    super.initState();

    value1 = widget.initialValue?.elementAtOrNull(0) ?? GradeValue.empty();
    value2 = widget.initialValue?.elementAtOrNull(1) ?? GradeValue.empty();
    showSecondRow = value2.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: 'GradeInputDialog.Title'.tr(),
      contentPadding: DialogPaddings.inputContent,
      contentBuilder: (context) => Form(
        key: formKey,
        child: Column(
          children: [
            _buildRowFields(0, value1, (value) => value1 = value!),
            if (showSecondRow) ...[
              FormLayout.fieldSpacer,
              _buildRowFields(1, value2, (value) => value2 = value!),
            ]
          ],
        ),
      ),
      actions: _buildActionButtons(context),
    );
  }

  Widget _buildRowFields(int row, GradeValue value, void Function(GradeValue?) onSaved) {
    return Row(
      children: [
        Flexible(
          child: GradeValueField(
            initialValue: value,
            gradingScale: widget.gradingScale,
            hintTextValue: 'GradeInputDialog.Value'.tr(),
            hintTextWeight: 'GradeInputDialog.Weight'.tr(),
            errorText: '',
            autofocus: row == 0 && value.isEmpty,
            onSaved: onSaved,
          ),
        ),
        FormLayout.fieldSpacer,
        _buildRowSwitch(row),
      ],
    );
  }

  Widget _buildRowSwitch(int row) {
    return showSecondRow
        ? (row > 0 ? _buildRowButton(false, Icons.remove_circle_outline) : SizedBox(width: 24))
        : _buildRowButton(true, Icons.add_circle_outline);
  }

  Widget _buildRowButton(bool showRow, IconData icon) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      onPressed: () => setState(() {
        showSecondRow = showRow;
        if (!showRow) value2 = GradeValue.empty();
      }),
      icon: Icon(icon),
    );
  }

  List<DialogActionButton> _buildActionButtons(BuildContext context) {
    return [
      if (widget.initialValue?.isNotEmpty == true)
        DialogActionButton.submit(
          context: context,
          title: 'Button.Delete'.tr(),
          returnValue: () {
            value1 = GradeValue.empty();
            value2 = GradeValue.empty();
            return _returnValue();
          },
        ),
      DialogActionButton.submit(
        formKey: formKey,
        context: context,
        title: 'Button.Save'.tr(),
        returnValue: () => _returnValue(),
      ),
    ];
  }

  List<GradeValue> _returnValue() {
    return value2.isEmpty
        ? value1.isEmpty
            ? List<GradeValue>.empty()
            : [value1]
        : [value1, value2];
  }
}

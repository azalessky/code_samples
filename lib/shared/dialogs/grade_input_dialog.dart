import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/shared/shared.dart';

class GradeInputDialog extends StatefulWidget {
  static const iconSize = 24.0;

  final Grade? initialValue;
  final GradesConfig config;
  final List<String> comments;
  final bool singleValue;
  final bool editWeight;
  final bool editAttendance;

  const GradeInputDialog({
    this.initialValue,
    required this.config,
    this.comments = const [],
    this.singleValue = false,
    this.editWeight = true,
    this.editAttendance = true,
    super.key,
  });

  @override
  State<GradeInputDialog> createState() => _GradeInputDialogState();
}

class _GradeInputDialogState extends State<GradeInputDialog> {
  final _formKey = GlobalKey<FormState>();
  late GradeValue _value1;
  late GradeValue _value2;
  late String _comment;
  late String _attendance;
  late bool _secondRow;
  late bool _attendanceMode;

  @override
  void initState() {
    super.initState();

    _value1 = widget.initialValue?.values.elementAtOrNull(0) ?? GradeValue.empty();
    _value2 = widget.initialValue?.values.elementAtOrNull(1) ?? GradeValue.empty();
    _comment = widget.initialValue?.comment ?? '';
    _attendance = widget.initialValue?.attendance ?? '';
    _secondRow = _value2.isNotEmpty;
    _attendanceMode = widget.initialValue?.attendance.isNotEmpty == true;
  }

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: _attendanceMode ? t.gradeInputDialog.attendanceTitle : t.gradeInputDialog.gradeTitle,
      titlePadding: DialogPaddings.dialogTitle,
      contentPadding: DialogPaddings.inputContent,
      contentBuilder: _attendanceMode ? _buildAttendanceContent : _buildGradeContent,
      actions: _buildActionButtons(context),
    );
  }

  Widget _buildGradeContent(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildRowFields(0, _value1, (value) => _value1 = value!),
          if (_secondRow) ...[
            FormLayout.fieldSpacer,
            _buildRowFields(1, _value2, (value) => _value2 = value!),
          ],
          FormLayout.fieldSpacer,
          _buildCommentField(),
        ],
      ),
    );
  }

  Widget _buildAttendanceContent(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildReasonField(),
          FormLayout.fieldSpacer,
          _buildCommentField(),
        ],
      ),
    );
  }

  Widget _buildRowFields(int row, GradeValue value, void Function(GradeValue?) onSaved) {
    return Row(
      spacing: FormLayout.fieldSpacing,
      children: [
        Flexible(
          child: GradeValueField(
            initialValue: value,
            config: widget.config,
            hintTextValue: t.gradeInputDialog.valueHint,
            hintTextWeight: t.gradeInputDialog.weightHint,
            editWeight: widget.editWeight,
            onSaved: onSaved,
          ),
        ),
        if (!widget.singleValue) _buildRowSwitch(row),
      ],
    );
  }

  Widget _buildCommentField() {
    return Row(
      spacing: FormLayout.fieldSpacing,
      children: [
        Flexible(
          child: SelectTextField(
            initialValue: _comment,
            values: widget.comments,
            hintText: t.gradeInputDialog.commentHint,
            dialogTitle: t.gradeInputDialog.commentHint,
            maxLength: FieldConstraints.gradeCommentLength,
            textCapitalization: .sentences,
            onSaved: (value) => setState(() => _comment = value),
          ),
        ),
        if (!widget.singleValue && !_attendanceMode) SizedBox(width: GradeInputDialog.iconSize),
      ],
    );
  }

  Widget _buildReasonField() {
    return DropDownField<String>(
      initialValue: _attendance,
      values: widget.config.attendanceMarks,
      hintText: t.gradeInputDialog.markHint,
      dialogTitle: t.gradeInputDialog.markHint,
      textBuilder: (value) => value,
      onSaved: (value) => setState(() => _attendance = value!),
    );
  }

  Widget _buildRowSwitch(int row) {
    return _secondRow
        ? (row > 0 ? _buildRowButton(false, Icons.remove_circle_outline) : SizedBox(width: 24))
        : _buildRowButton(true, Icons.add_circle_outline);
  }

  Widget _buildRowButton(bool showRow, IconData icon) {
    return IconButton(
      iconSize: GradeInputDialog.iconSize,
      padding: .zero,
      constraints: const BoxConstraints(),
      style: const ButtonStyle(tapTargetSize: .shrinkWrap),
      onPressed: () => setState(() {
        _secondRow = showRow;
        if (!showRow) _value2 = GradeValue.empty();
      }),
      icon: Icon(icon),
    );
  }

  List<DialogActionButton> _buildActionButtons(BuildContext context) {
    return [
      if (widget.initialValue?.isNotEmpty == true)
        DialogActionButton.submit<Grade>(
          context: context,
          title: t.button.delete,
          returnValue: () => Grade.empty(),
        )
      else if (widget.editAttendance)
        DialogActionButton(
          title: _attendanceMode
              ? t.gradeInputDialog.gradeButton
              : t.gradeInputDialog.attdendanceButton,
          onPressed: () => setState(() => _attendanceMode = !_attendanceMode),
        ),
      DialogActionButton.submit<Grade>(
        formKey: _formKey,
        context: context,
        title: t.button.save,
        returnValue: _attendanceMode ? _returnAttendanceValue : _returnGradeValue,
      ),
    ];
  }

  GradeValue _checkWeight(GradeValue value) {
    if (value.isEmpty || value.weight > 0) return value;
    return value.copyWith(weight: 1);
  }

  Grade _returnGradeValue() {
    _value1 = _checkWeight(_value1);
    _value2 = _checkWeight(_value2);

    final values = _value2.isEmpty
        ? _value1.isEmpty
              ? List<GradeValue>.empty()
              : [_value1]
        : [_value1, _value2];

    final grade = widget.initialValue ?? Grade.empty();
    return grade.copyWith(values: values, comment: _comment);
  }

  Grade _returnAttendanceValue() {
    final grade = widget.initialValue ?? Grade.empty();
    return grade.copyWith(attendance: _attendance, comment: _comment);
  }
}

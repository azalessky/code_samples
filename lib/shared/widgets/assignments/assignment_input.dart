import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/shared/shared.dart';

class AssignmentInput extends StatefulWidget {
  static const bodyHeight = 200.0;
  static const textPadding = EdgeInsets.fromLTRB(16, 12, 16, 0);
  static const listPadding = EdgeInsets.fromLTRB(14, 10, 14, 0);

  final AssignmentContent initialValue;
  final String hintText;
  final String addText;
  final int minLines;
  final bool autofocus;
  final Widget? top;
  final Widget? bottom;
  final ValueChanged<AssignmentContent>? onChanged;
  final ValueChanged<AssignmentContent>? onSaved;

  const AssignmentInput({
    required this.initialValue,
    required this.hintText,
    required this.addText,
    this.minLines = 3,
    this.autofocus = false,
    this.top,
    this.bottom,
    this.onChanged,
    this.onSaved,
    super.key,
  });

  @override
  State<AssignmentInput> createState() => _AssignmentInputState();
}

class _AssignmentInputState extends State<AssignmentInput> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).inputDecorationTheme;
    final inputBorder =
        (_focusNode.hasFocus ? theme.focusedBorder : theme.enabledBorder) as OutlineInputBorder;

    final boxDecoration = BoxDecoration(
      color: theme.fillColor,
      borderRadius: inputBorder.borderRadius,
      border: BoxBorder.all(
        color: inputBorder.borderSide.color,
        width: inputBorder.borderSide.width,
      ),
    );

    final clipRadius = inputBorder.borderRadius.subtract(
      BorderRadius.all(Radius.circular(inputBorder.borderSide.width)),
    );

    final borderWidth = inputBorder.borderSide.width;
    final contentPadding = widget.initialValue.when(
      text: (text) => AssignmentInput.textPadding,
      list: (items) => AssignmentInput.listPadding,
    );
    final bodyPadding = (contentPadding - EdgeInsets.all(borderWidth)).clamp(
      EdgeInsetsGeometry.zero,
      contentPadding,
    );

    return Container(
      decoration: boxDecoration,
      child: ClipRRect(
        borderRadius: clipRadius,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.top != null) widget.top!,
            Container(
              padding: bodyPadding,
              child: widget.initialValue.when(
                text: (text) => _buildTextField(text),
                list: (items) => _buildListField(items),
              ),
            ),
            if (widget.bottom != null) widget.bottom!,
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String text) {
    final textBorder = OutlineInputBorder(borderSide: BorderSide.none, gapPadding: 0);
    final textDecoration = InputDecoration(
      hintText: widget.hintText,
      border: textBorder,
      enabledBorder: textBorder,
      focusedBorder: textBorder,
      errorBorder: textBorder,
      disabledBorder: textBorder,
      filled: false,
      isCollapsed: true,
    );

    return TextFormField(
      initialValue: text,
      decoration: textDecoration,
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      minLines: widget.minLines,
      maxLines: null,
      textAlignVertical: .top,
      inputFormatters: [LengthLimitingTextInputFormatter(FieldConstraints.assignmentTextLength)],
      textCapitalization: .sentences,
      onChanged: (value) => widget.onChanged?.call(TextContent(value)),
      onSaved: (value) => widget.onSaved?.call(TextContent(value ?? '')),
    );
  }

  Widget _buildListField(List<CheckItem> items) {
    return CheckListField(
      initialValue: items,
      addText: widget.addText,
      focusNode: _focusNode,
      maxLength: FieldConstraints.assignmentItemLength,
      onChanged: (value) => widget.onChanged?.call(ListContent(value)),
      onSaved: (value) => widget.onSaved?.call(ListContent(value)),
    );
  }

  void _handleFocusChange() {
    setState(() {});
  }
}

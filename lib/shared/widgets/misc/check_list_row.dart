import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/shared/shared.dart';

class CheckListRow extends StatefulWidget {
  static const iconSize = 20.0;
  static const iconPadding = EdgeInsets.all(4);
  static const rowPadding = EdgeInsets.symmetric(vertical: 3);
  static const textFactor = 0.9;

  final CheckItem initialValue;
  final int index;
  final bool placeholder;
  final int maxLength;
  final String addText;
  final FocusNode focusNode;
  final VoidCallback? onTap;
  final ValueChanged<CheckItem>? onChanged;
  final VoidCallback? onSubmitted;
  final VoidCallback? onDelete;

  const CheckListRow({
    super.key,
    required this.initialValue,
    required this.index,
    this.placeholder = false,
    required this.maxLength,
    required this.addText,
    required this.focusNode,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.onDelete,
  });

  @override
  State<CheckListRow> createState() => _CheckListRowState();
}

class _CheckListRowState extends State<CheckListRow> {
  late final TextEditingController _controller;
  late bool _isChecked;
  late bool _hasFocus;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.initialValue.text);
    _isChecked = widget.initialValue.checked;
    _hasFocus = false;

    widget.focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.focusNode.removeListener(_handleFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CheckListRow.rowPadding,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          crossAxisAlignment: .start,
          spacing: FormLayout.textSpacing,
          children: widget.placeholder ? _buildAddRow(context) : _buildCheckRow(),
        ),
      ),
    );
  }

  List<Widget> _buildAddRow(BuildContext context) {
    final hintColor = Theme.of(context).hintColor;
    final baseStyle = context.textTheme.titleMedium;

    return [
      TapIcon(icon: Symbols.add, padding: .zero),
      Expanded(
        child: Text(
          widget.addText,
          style: baseStyle?.copyWith(color: hintColor),
        ),
      ),
    ];
  }

  List<Widget> _buildCheckRow() {
    return [
      _buildCheckbox(context),
      _buildTextField(context),
      _buildDeleteButton(),
    ];
  }

  Widget _buildCheckbox(BuildContext context) {
    final icon = _isChecked ? Symbols.check_box : Symbols.check_box_outline_blank;

    return TapIcon(
      icon: icon,
      padding: EdgeInsets.zero,
      onTap: () => setState(() {
        _isChecked = !_isChecked;
        _handleChange();
      }),
    );
  }

  Widget _buildTextField(BuildContext context) {
    final textDecoration = InputDecoration.collapsed(hintText: '').copyWith(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
    );

    final baseStyle = context.textTheme.bodyLarge!;
    final textStyle = baseStyle.copyWith(
      height: baseStyle.height! * CheckListRow.textFactor,
    );

    return Expanded(
      child: KeyboardListener(
        focusNode: FocusNode(skipTraversal: true),
        onKeyEvent: _handleKeyEvent,
        child: TextField(
          controller: _controller,
          focusNode: widget.focusNode,
          decoration: textDecoration,
          style: textStyle,
          maxLines: null,
          keyboardType: .text,
          textInputAction: .next,
          textCapitalization: .sentences,
          inputFormatters: [LengthLimitingTextInputFormatter(widget.maxLength)],
          onChanged: (_) => _handleChange(),
          onSubmitted: (_) => _handleSubmit(),
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return AnimatedOpacity(
      opacity: _hasFocus ? 1 : 0,
      duration: AnimationSettings.switchDuration,
      child: TapIcon(
        icon: Symbols.close,
        padding: .zero,
        onTap: _hasFocus ? widget.onDelete : null,
      ),
    );
  }

  void _handleFocusChange() {
    setState(() => _hasFocus = widget.focusNode.hasFocus);
  }

  void _handleChange() {
    widget.onChanged?.call((text: _controller.text, checked: _isChecked));
  }

  void _handleSubmit() {
    FocusScope.of(context).requestFocus(widget.focusNode);
    widget.onSubmitted?.call();
  }

  void _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent && event.logicalKey == .backspace) {
      if (_controller.text.isEmpty && _hasFocus) {
        widget.onDelete?.call();
      }
    }
  }
}

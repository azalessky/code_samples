import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_planner/common/common.dart';

class PrefixedTextField extends StatefulWidget {
  final String initialValue;
  final String prefixText;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final ValueChanged<String?>? onSaved;

  const PrefixedTextField({
    super.key,
    required this.initialValue,
    required this.prefixText,
    required this.hintText,
    this.inputFormatters,
    this.keyboardType,
    this.onSaved,
  });

  @override
  State<PrefixedTextField> createState() => _PrefixedTextFieldState();
}

class _PrefixedTextFieldState extends State<PrefixedTextField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _focusNode = FocusNode()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showHint = !_focusNode.hasFocus && _controller.text.isEmpty;

    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        prefix: showHint ? null : context.textLarge('${widget.prefixText} '),
        hintText: showHint ? widget.hintText : null,
      ),
      onSaved: (value) => widget.onSaved?.call(value),
    );
  }
}

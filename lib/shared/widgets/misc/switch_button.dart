import 'package:flutter/material.dart';

class SwitchButton<T extends Enum> extends StatefulWidget {
  final T initialValue;
  final List<T> values;
  final Widget Function(T) iconBuilder;
  final void Function(T) onPressed;

  const SwitchButton({
    required this.initialValue,
    required this.values,
    required this.iconBuilder,
    required this.onPressed,
    super.key,
  });

  @override
  State<SwitchButton<T>> createState() => _SwitchButtonState<T>();
}

class _SwitchButtonState<T extends Enum> extends State<SwitchButton<T>> {
  late T _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  void _switchValue() {
    setState(() {
      final current = widget.values.indexOf(_selectedValue);
      final next = (current + 1) % widget.values.length;

      _selectedValue = widget.values[next];
      widget.onPressed(_selectedValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _switchValue,
      icon: widget.iconBuilder(_selectedValue),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';

class FadeIconButton extends StatefulWidget {
  final bool visible;
  final bool toggled;
  final IconData icon;
  final IconData? iconOff;
  final VoidCallback? onPressed;

  const FadeIconButton({
    super.key,
    this.visible = true,
    this.toggled = true,
    required this.icon,
    this.iconOff,
    this.onPressed,
  });

  @override
  State<FadeIconButton> createState() => _FadeIconButtonState();
}

class _FadeIconButtonState extends State<FadeIconButton> {
  final _buttonKey = UniqueKey();
  final _emptyKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AnimationSettings.switchDuration,
      child: widget.visible
          ? IconButton(
              key: _buttonKey,
              onPressed: widget.onPressed,
              icon: Icon(widget.toggled ? (widget.iconOff ?? widget.icon) : widget.icon),
            )
          : SizedBox.shrink(key: _emptyKey),
    );
  }
}

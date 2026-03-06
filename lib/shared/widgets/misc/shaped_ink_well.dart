import 'package:flutter/material.dart';

class ShapedInkWell extends StatelessWidget {
  final Widget child;
  final ShapeBorder shape;
  final Color backgroundColor;
  final Clip clipBehavior;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const ShapedInkWell({
    super.key,
    required this.child,
    required this.shape,
    this.backgroundColor = Colors.transparent,
    this.clipBehavior = .antiAlias,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: .expand,
      children: [
        if (backgroundColor != Colors.transparent)
          ClipPath(
            clipper: ShapeBorderClipper(shape: shape),
            child: ColoredBox(color: backgroundColor),
          ),
        ClipPath(
          clipper: ShapeBorderClipper(shape: shape),
          child: child,
        ),
        Material(
          color: Colors.transparent,
          shape: shape,
          clipBehavior: clipBehavior,
          child: InkWell(
            onTap: onTap,
            onLongPress: onLongPress,
            customBorder: shape,
          ),
        ),
      ],
    );
  }
}

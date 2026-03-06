import 'package:flutter/material.dart';

class TapIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  const TapIcon({
    super.key,
    required this.icon,
    this.size = 20,
    this.padding = const .all(4),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(size),
      child: Padding(
        padding: padding,
        child: Icon(
          icon,
          size: size,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

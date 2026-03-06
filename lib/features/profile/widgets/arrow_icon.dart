import 'package:flutter/material.dart';

class ArrowIcon extends StatelessWidget {
  static const iconSize = 24.0;
  static const iconPadding = 16.0;
  static const animationDuration = Duration(milliseconds: 200);

  final bool isExpanded;
  final VoidCallback onPressed;

  const ArrowIcon({
    required this.isExpanded,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hitWidth = iconSize + iconPadding * 2;

    return GestureDetector(
      behavior: .translucent,
      onTap: onPressed,
      child: SizedBox(
        height: .infinity,
        width: hitWidth,
        child: Padding(
          padding: const .only(right: iconPadding),
          child: AnimatedRotation(
            turns: isExpanded ? 0.5 : 0.0,
            duration: animationDuration,
            alignment: .center,
            curve: Curves.easeInOut,
            child: const Icon(Icons.expand_more, size: iconSize),
          ),
        ),
      ),
    );
  }
}

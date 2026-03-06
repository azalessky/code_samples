import 'package:flutter/material.dart';

class DropDownIcon extends StatelessWidget {
  static const iconSize = 24.0;

  const DropDownIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.arrow_drop_down, size: iconSize);
  }
}

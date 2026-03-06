import 'package:flutter/material.dart';

class EmptyIcon extends StatelessWidget {
  const EmptyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final size = IconTheme.of(context).size ?? 24.0;
    return SizedBox.square(dimension: size);
  }
}

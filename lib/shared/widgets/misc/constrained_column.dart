import 'package:flutter/material.dart';

class ConstrainedColumn extends StatelessWidget {
  final List<Widget> children;

  const ConstrainedColumn({
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(children: children),
          ),
        ),
      ),
    );
  }
}

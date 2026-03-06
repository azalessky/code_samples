import 'package:flutter/material.dart';

import 'package:student_planner/shared/shared.dart';

class FractionalDialog extends StatelessWidget {
  final String? title;
  final double heightFactor;
  final EdgeInsets titlePadding;
  final EdgeInsets contentPadding;
  final WidgetBuilder contentBuilder;
  final List<DialogActionButton>? actions;

  const FractionalDialog({
    super.key,
    this.title,
    required this.heightFactor,
    required this.titlePadding,
    required this.contentPadding,
    required this.contentBuilder,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: title,
      titlePadding: titlePadding,
      contentPadding: contentPadding,
      contentBuilder: (_) => ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * heightFactor,
        ),
        child: contentBuilder(context),
      ),
      actions: actions,
    );
  }
}

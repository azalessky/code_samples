import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class MessageDialog extends StatelessWidget {
  final String title;
  final String text;

  const MessageDialog({
    required this.title,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: title,
      titlePadding: DialogPaddings.dialogTitle,
      contentPadding: DialogPaddings.messageContent,
      contentBuilder: (_) => context.textLarge(text),
      actions: [
        DialogActionButton(
          title: t.button.ok,
          onPressed: () => context.maybePop(true),
        ),
      ],
    );
  }
}

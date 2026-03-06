import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

Future<bool?> showPromptDialog({
  required String title,
  required String text,
  VoidCallback? onConfirmed,
}) {
  return showModalDialog<bool>(
    builder: (_) => PromptDialog(title: title, text: text),
    onSaved: (value) => value ? onConfirmed?.call() : null,
  );
}

class PromptDialog extends StatelessWidget {
  final String title;
  final String text;

  const PromptDialog({
    required this.title,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: title,
      titlePadding: DialogPaddings.dialogTitle,
      contentPadding: DialogPaddings.promptContent,
      contentBuilder: (_) => Text(
        text,
        style: context.textTheme.bodyLarge,
        textAlign: .center,
      ),
      actions: [
        DialogActionButton(
          title: t.button.cancel,
          onPressed: () => context.maybePop(false),
        ),
        DialogActionButton(
          title: t.button.ok,
          onPressed: () => context.maybePop(true),
        ),
      ],
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:student_planner/common/common.dart';

Future<T?> showModalDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  void Function(T)? onSaved,
  void Function()? onCancelled,
}) async {
  FocusManager.instance.primaryFocus?.unfocus();

  final T? value = await showModalBottomSheet<T>(
    isScrollControlled: true,
    context: context,
    builder: builder,
  );

  if (value != null) {
    onSaved?.call(value);
  } else {
    onCancelled?.call();
  }
  return value;
}

class GenericDialog extends StatelessWidget {
  final String? title;
  final EdgeInsets contentPadding;
  final WidgetBuilder contentBuilder;
  final List<DialogActionButton>? actions;

  const GenericDialog({
    this.title,
    required this.contentPadding,
    required this.contentBuilder,
    this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    final padding = bottomInsets > 0
        ? Platform.isIOS
            ? DialogPaddings.keyboardiOS
            : DialogPaddings.keyboardAndroid
        : Platform.isIOS
            ? DialogPaddings.screeniOS
            : DialogPaddings.screenAndroid;

    return Padding(
      padding: padding + EdgeInsets.only(bottom: bottomInsets),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Padding(
              padding: DialogPaddings.dialogTitle,
              child: Text(
                title!,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
          Padding(
            padding: contentPadding,
            child: contentBuilder(context),
          ),
          if (actions?.isNotEmpty == true) _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: DialogPaddings.actionButtons,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: actions!,
          ),
        ),
      ],
    );
  }
}

class DialogActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const DialogActionButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  static DialogActionButton submit<T>({
    GlobalKey<FormState>? formKey,
    required BuildContext context,
    required String title,
    required T Function() returnValue,
  }) =>
      DialogActionButton(
        title: title,
        onPressed: () {
          if (formKey != null) {
            if (!formKey.currentState!.validate()) return;
            formKey.currentState!.save();
          }
          context.maybePop<T>(returnValue());
        },
      );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextButton(
          onPressed: onPressed,
          child: Text(title),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:student_planner/common/common.dart';

Future<T?> showModalDialog<T>({
  required WidgetBuilder builder,
  void Function(T)? onSaved,
}) async {
  FocusManager.instance.primaryFocus?.unfocus();

  final T? value = await showModalBottomSheet<T>(
    isScrollControlled: true,
    useRootNavigator: true,
    context: navigatorKey.currentContext!,
    builder: builder,
  );

  if (value != null) onSaved?.call(value);
  return value;
}

class GenericDialog extends StatelessWidget {
  final String? title;
  final EdgeInsets titlePadding;
  final EdgeInsets contentPadding;
  final WidgetBuilder contentBuilder;
  final List<DialogActionButton>? actions;

  const GenericDialog({
    super.key,
    this.title,
    required this.titlePadding,
    required this.contentPadding,
    required this.contentBuilder,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    final navBarPadding = MediaQuery.of(context).padding.bottom;
    final bottomPadding = EdgeInsets.only(bottom: bottomInsets + navBarPadding);

    return Padding(
      padding: DialogPaddings.dialogContainer + bottomPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Padding(
              padding: titlePadding,
              child: context.titleAverage(title!),
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
        Divider(
          color: context.colorScheme.outlineVariant,
        ),
        Padding(
          padding: DialogPaddings.actionButtons,
          child: Row(
            mainAxisAlignment: .spaceEvenly,
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
  }) => DialogActionButton(
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

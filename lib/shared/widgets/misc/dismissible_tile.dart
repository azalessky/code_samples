import 'package:flutter/material.dart';

import 'package:student_planner/shared/shared.dart';

enum DismissibleAction { positive, negative }

class DismissibleTile extends StatelessWidget {
  static const iconPadding = EdgeInsets.symmetric(horizontal: 16);
  static const iconSize = 24.0;

  final Key uniqueKey;
  final DismissibleAction action;
  final DismissibleAction? secondaryAction;
  final IconData icon;
  final IconData? secondaryIcon;
  final String? promptTitle;
  final String? promptText;
  final String? secondaryPromptTitle;
  final String? secondaryPromptText;
  final Widget child;
  final Function()? onAction;
  final Function()? onSecondaryAction;

  const DismissibleTile({
    required this.uniqueKey,
    required this.action,
    this.secondaryAction,
    required this.icon,
    this.secondaryIcon,
    this.promptTitle,
    this.promptText,
    this.secondaryPromptTitle,
    this.secondaryPromptText,
    required this.child,
    this.onAction,
    this.onSecondaryAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final background = _buildBackground(context, true, action);
    final secondaryBackground = _buildBackground(context, false, secondaryAction ?? action);

    return Dismissible(
      key: uniqueKey,
      background: background,
      secondaryBackground: secondaryBackground,
      direction: DismissDirection.horizontal,
      confirmDismiss: (direction) => _confirmDismiss(context, direction),
      onDismissed: _handleDismiss,
      child: child,
    );
  }

  Widget _buildBackground(BuildContext context, bool primary, DismissibleAction action) {
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = action == DismissibleAction.positive
        ? colorScheme.primary
        : colorScheme.error;
    final iconColor = action == DismissibleAction.positive
        ? colorScheme.onPrimary
        : colorScheme.onError;

    final iconData = primary ? icon : secondaryIcon ?? icon;
    final alignment = primary ? Alignment.centerLeft : Alignment.centerRight;

    return Container(
      color: backgroundColor,
      alignment: alignment,
      padding: iconPadding,
      child: Icon(iconData, color: iconColor, size: iconSize),
    );
  }

  Future<bool?> _promptDismiss(BuildContext context, String? title, String? text) async {
    if (title == null || text == null) return true;
    return showPromptDialog(title: title, text: text);
  }

  Future<bool?> _confirmDismiss(BuildContext context, DismissDirection direction) async {
    if (direction == DismissDirection.startToEnd) {
      return _promptDismiss(context, promptTitle, promptText);
    } else if (direction == DismissDirection.endToStart) {
      return _promptDismiss(
        context,
        secondaryPromptTitle ?? promptTitle,
        secondaryPromptText ?? promptText,
      );
    }
    return null;
  }

  void _handleDismiss(DismissDirection direction) {
    if (direction == DismissDirection.startToEnd) {
      onAction?.call();
    } else if (direction == DismissDirection.endToStart) {
      (onSecondaryAction ?? onAction)?.call();
    }
  }
}

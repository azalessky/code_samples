import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/features/shared/shared.dart';

enum DismissibleAction {
  actionDelete,
  actionComplete,
}

class DismissibleTile extends StatelessWidget {
  final DismissibleAction action;
  final String? promptTitle;
  final String? promptText;
  final DismissDirectionCallback? onDismissed;
  final Widget child;

  const DismissibleTile({
    required this.action,
    this.promptTitle,
    this.promptText,
    this.onDismissed,
    required this.child,
    required super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key!,
      background: _buildBackground(context, Alignment.centerLeft),
      secondaryBackground: _buildBackground(context, Alignment.centerRight),
      direction: DismissDirection.horizontal,
      confirmDismiss: promptTitle != null && promptText != null
          ? (_) => showPromptDialog(
                context: context,
                title: promptTitle!,
                text: promptText!,
              )
          : null,
      onDismissed: onDismissed,
      child: child,
    );
  }

  Widget _buildBackground(BuildContext context, AlignmentGeometry alignment) {
    final style = _widgetStyle(context);

    return Container(
      color: style.$1,
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Icon(style.$3, color: style.$2, size: 24),
    );
  }

  (Color, Color, IconData) _widgetStyle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return switch (action) {
      DismissibleAction.actionDelete => (
          colorScheme.error,
          colorScheme.onError,
          Symbols.delete,
        ),
      DismissibleAction.actionComplete => (
          colorScheme.primary,
          colorScheme.onPrimary,
          Symbols.check,
        ),
    };
  }
}

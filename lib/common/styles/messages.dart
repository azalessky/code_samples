import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';

enum UserMessage {
  assignmentCompleted,
  dataUpdated,
  profileDeleted,
  errorOccurred,
  noConnection,
}

class Messages {
  final globalKey = GlobalKey<ScaffoldMessengerState>();
  final _showDuration = Duration(milliseconds: 2000);
  Timer? _debounceTimer;

  void showMessage(UserMessage message, {Duration? debounce}) {
    if (debounce != null) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(debounce, () => _showSnackBar(message));
    } else {
      _showSnackBar(message);
    }
  }

  void _showSnackBar(UserMessage message) {
    final data = switch (message) {
      UserMessage.assignmentCompleted => (t.message.assignmentCompleted, Symbols.thumb_up),
      UserMessage.dataUpdated => (t.message.dataUpdated, Symbols.sync),
      UserMessage.profileDeleted => (t.message.profileDeleted, Symbols.delete),
      UserMessage.errorOccurred => (t.message.errorOccurred, Symbols.error),
      UserMessage.noConnection => (t.message.noConnection, Symbols.cloud_off),
    };

    globalKey.currentState?.showSnackBar(
      SnackBar(
        content: _buildContent(data.$1, data.$2),
        behavior: .floating,
        margin: .zero,
        duration: _showDuration,
      ),
    );
  }

  Widget _buildContent(String text, IconData? icon) {
    final color = Theme.of(globalKey.currentState!.context).colorScheme.onInverseSurface;
    return Row(
      spacing: FormLayout.textSpacing,
      children: [
        if (icon != null) Icon(icon, color: color, size: 20),
        Text(text),
      ],
    );
  }
}

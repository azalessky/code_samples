import 'package:flutter/material.dart';

enum SnackBarStyle {
  info,
  warning,
  error,
}

class MessengerHelper {
  final messengerKey = GlobalKey<ScaffoldMessengerState>();

  void showSnackBar(SnackBarStyle style, String text) {
    final delay = switch (style) {
      SnackBarStyle.info => 1500,
      SnackBarStyle.warning => 3000,
      SnackBarStyle.error => 3000,
    };

    messengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.zero,
        duration: Duration(milliseconds: delay),
      ),
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme get _textTheme => Theme.of(this).textTheme;

  Text textSmall(String text) {
    return Text(text, style: _textTheme.bodySmall);
  }

  Text textMedium(String text) {
    return Text(text, style: _textTheme.bodyMedium);
  }

  Text textLarge(String text) {
    return Text(text, style: _textTheme.bodyLarge);
  }

  Text titleMedium(String text) {
    return Text(text, style: _textTheme.titleMedium);
  }

  Text titleSmall(String text) {
    return Text(text, style: _textTheme.titleSmall);
  }

  Text labelLarge(String text) {
    return Text(text, style: _textTheme.labelLarge);
  }
}

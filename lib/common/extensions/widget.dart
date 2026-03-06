import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Color get textColor => textTheme.bodyMedium!.color!;

  Text textSmall(String text) {
    return Text(text, style: textTheme.bodySmall);
  }

  Text textMedium(String text) {
    return Text(text, style: textTheme.bodyMedium);
  }

  Text textLarge(String text) {
    return Text(text, style: textTheme.bodyLarge);
  }

  Text titleSmall(String text) {
    return Text(text, style: textTheme.titleSmall);
  }

  Text titleMedium(String text) {
    return Text(text, style: textTheme.titleMedium);
  }

  Text titleLarge(String text) {
    return Text(text, style: textTheme.titleLarge);
  }

  Text titleAverage(String text) {
    final mediumSize = textTheme.titleMedium!.fontSize!;
    final largeSize = textTheme.titleLarge!.fontSize!;
    final fontSize = (mediumSize + largeSize) / 2;
    final textStyle = textTheme.titleMedium?.copyWith(fontSize: fontSize);

    return Text(text, style: textStyle);
  }

  Text labelSmall(String text) {
    return Text(text, style: textTheme.labelSmall);
  }

  Text labelLarge(String text) {
    return Text(text, style: textTheme.labelLarge);
  }
}

extension WidgetExtension on Widget {
  Widget get debugFrame => Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.red),
    ),
    child: this,
  );
}

import 'strings.g.dart';

extension EnumExtension on Enum {
  String tr() {
    final str = toString();
    final key = str[0].toLowerCase() + str.substring(1);

    return t[key] ?? key;
  }
}

extension StringExtension on String {
  String tr() => t[this] ?? this;
}

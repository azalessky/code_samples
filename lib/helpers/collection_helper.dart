import 'package:collection/collection.dart';

extension ListExtension<T> on List<T> {
  bool differs(List<T> value) => !equals(value);

  List<T> exclude(T value) {
    var list = toList();
    list.removeWhere((e) => e == value);
    return list;
  }

  List<T> excludeAt(int index) {
    var list = toList();
    list.removeAt(index);
    return list;
  }

  List<T> excludeWhere(bool Function(T) test) {
    var list = toList();
    list.removeWhere(test);
    return list;
  }

  List<T> excludeList(List<T> values) {
    var list = toList();
    list.removeWhere((e) => values.contains(e));
    return list;
  }

  List<T> replace(int index, T value) {
    return [
      ...sublist(0, index),
      value,
      ...sublist(index + 1),
    ];
  }
}

extension StringListExtension on List<String> {
  String foldSeparated(String separator) {
    return fold('', (prev, e) => '$prev${prev.isEmpty ? '' : '$separator '}$e');
  }
}

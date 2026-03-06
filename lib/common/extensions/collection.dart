import 'package:collection/collection.dart';

extension ListExtension<T> on List<T> {
  bool differs(List<T> value) => !equals(value);

  List<T> exclude(T value) {
    final list = toList();
    list.removeWhere((e) => e == value);
    return list;
  }

  List<T> excludeAt(int index) {
    final list = toList();
    list.removeAt(index);
    return list;
  }

  List<T> excludeWhere(bool Function(T) test) {
    final list = toList();
    list.removeWhere(test);
    return list;
  }

  List<T> excludeList(List<T> values) {
    final list = toList();
    list.removeWhere((e) => values.contains(e));
    return list;
  }

  List<T> addUnique(T value) {
    final list = toList();
    if (!list.contains(value)) list.add(value);
    return list;
  }

  List<T> replace(int index, T value) {
    return [
      ...sublist(0, index),
      value,
      ...sublist(index + 1),
    ];
  }

  void move(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex -= 1;
    final item = removeAt(oldIndex);
    insert(newIndex, item);
  }

  void reverse() {
    reverseRange(0, length);
  }

  void sortGrouped<K>({
    required K Function(T) groupBy,
    required int Function(K a, K b) compareGroups,
    required int Function(T a, T b) compareItems,
  }) {
    final groups = <K, List<T>>{};
    for (final item in this) {
      final key = groupBy(item);
      groups.putIfAbsent(key, () => []).add(item);
    }

    final keys = groups.keys.toList()..sort(compareGroups);
    clear();

    for (final key in keys) {
      final group = groups[key]!..sort(compareItems);
      addAll(group);
    }
  }
}

import 'package:collection/collection.dart';

import 'package:student_planner/models/models.dart';

mixin ListState<T extends BaseObject> {
  List<T> get state;
  set state(List<T> values);

  T? getItem(String id) => state.singleWhereOrNull((e) => e.id == id);

  void setItem(T item) {
    final existing = getItem(item.id);
    if (existing == null) {
      addItem(item);
    } else {
      updateItem(existing.id, (_) => item);
    }
  }

  void addItem(T item) {
    final newState = [...state, item];
    sortItems(newState);
    state = newState;
  }

  void addItems(List<T> items) {
    final newState = [...state, ...items];
    sortItems(newState);
    state = newState;
  }

  void removeItem(String id) {
    final newState = state.where((e) => e.id != id).toList();
    state = newState;
  }

  void removeAll() {
    state = const [];
  }

  void updateItem(String id, T Function(T item) update) {
    final newState = state.map((e) => e.id == id ? update(e) : e).toList();
    sortItems(newState);
    state = newState;
  }

  void sortItems(List<T> items) {
    final isSortable = items.every((e) => e is Comparable);
    if (isSortable) items.sort();
  }
}

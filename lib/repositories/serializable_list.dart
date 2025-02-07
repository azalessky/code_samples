import 'package:collection/collection.dart';

import 'package:student_planner/models/models.dart';
import 'package:student_planner/repositories/repositories.dart';

mixin SerializableList<T extends Serializable> implements SerializableBase<T> {
  List<T> get state;
  set state(List<T> values);

  void Function()? get sortItems => null;

  @override
  dynamic serialize() {
    return state.map((e) => e.toJson()).toList();
  }

  @override
  void deserialize(dynamic json) {
    state = json.map<T>((e) => deserializer(e)).toList();
  }

  T? getItem(String id) {
    return state.singleWhereOrNull((e) => e.id == id);
  }

  void setItem(T item) {
    final existing = getItem(item.id);
    if (existing == null) {
      addItem(item);
    } else {
      updateItem(existing.id, (_) => item);
    }
  }

  void addItem(T item) {
    state.add(item);
    sortItems?.call();
    state = [...state];
  }

  void addItems(List<T> items) {
    state.addAll(items);
    sortItems?.call();
    state = [...state];
  }

  void removeItem(String id) {
    state.removeWhere((e) => e.id == id);
    state = [...state];
  }

  void removeAll() {
    state.clear();
    state = [...state];
  }

  void updateItem(String id, T Function(T item) update) {
    final index = state.indexWhere((e) => e.id == id);
    if (index >= 0) {
      state[index] = update(state[index]);
      sortItems?.call();
      state = [...state];
    }
  }
}

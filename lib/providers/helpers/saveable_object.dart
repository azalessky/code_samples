import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/repositories/repositories.dart';

mixin SaveableObject<T> implements SaveableBase {
  T get state;
  set state(T value);

  void subscribe(Ref ref) {
    final sub = repository.stream.listen((value) => state = value);
    ref.onDispose(sub.cancel);
  }

  @override
  ObjectRepository<T> get repository;

  @override
  Future<void> save() => repository.save(state, .auto);

  @override
  void invalidate();
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/repositories/repositories.dart';

mixin SaveableList<T> implements SaveableBase {
  List<T> get state;
  set state(List<T> value);

  void subscribe(Ref ref) {
    final sub = repository.stream.listen((value) => state = value);
    ref.onDispose(sub.cancel);
  }

  @override
  ListRepository<T> get repository;

  @override
  Future<void> save() => repository.save(state, .auto);

  @override
  void invalidate();
}

import 'package:student_planner/common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/repositories/repositories.dart';

part 'teachers.g.dart';

@Riverpod(keepAlive: true)
class Teachers extends _$Teachers with ListState<Teacher>, SaveableList<Teacher> {
  @override
  ListRepository<Teacher> get repository => teachersRepository;

  @override
  List<Teacher> build() {
    subscribe(ref);
    return repository.state ?? [];
  }

  @override
  void invalidate() => ref.invalidateSelf();

  List<String> get names => state.map((e) => e.name).toList();
}

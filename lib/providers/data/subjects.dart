import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/repositories/repositories.dart';

part 'subjects.g.dart';

@Riverpod(keepAlive: true)
class Subjects extends _$Subjects with ListState<Subject>, SaveableList<Subject> {
  @override
  ListRepository<Subject> get repository => subjectsRepository;

  @override
  List<Subject> build() {
    subscribe(ref);
    return repository.state ?? _defaultValue();
  }

  @override
  void invalidate() => ref.invalidateSelf();

  List<String> get names => state.map((e) => e.name).toList();

  Subject? getSubject(String name) {
    return state.firstWhereOrNull((s) => s.name == name);
  }

  void resetSubjects() {
    removeAll();
    addItems(_defaultValue());
  }

  List<Subject> _defaultValue() {
    final config = ref.read(settingsProvider.select((c) => c.general));
    return resources.getSubjects(config.appLanguage);
  }
}

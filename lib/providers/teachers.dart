import 'package:student_planner/common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/repositories/repositories.dart';
import 'package:student_planner/models/models.dart';

part 'teachers.g.dart';

@Riverpod(keepAlive: true)
class Teachers extends _$Teachers with SerializableList<Teacher> {
  @override
  List<Teacher> build() {
    return cachedRepository.getObjectList<Teacher>(this) ?? [];
  }

  @override
  String get jsonKey => RepositorySettings.teachersKey;

  @override
  get deserializer => Teacher.fromJson;

  @override
  get sortItems => _sortItems;

  List<String> get names => state.map((e) => e.name).toList();

  void addTeacher(String name, List<String> subjects, String note, String avatar) {
    addItem(
      Teacher.empty().copyWith(name: name, subjects: subjects, note: note, avatar: avatar),
    );
  }

  void updateTeacher(String id, String name, List<String> subjects, String note, String avatar) {
    updateItem(
      id,
      (item) => item.copyWith(name: name, subjects: subjects, note: note, avatar: avatar),
    );
  }

  void _sortItems() {
    state.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }
}

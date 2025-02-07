import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/repositories/repositories.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/common/common.dart';

part 'notes.g.dart';

@Riverpod(keepAlive: true)
class Notes extends _$Notes with SerializableList<Note> {
  @override
  List<Note> build() {
    return cachedRepository.getObjectList<Note>(this) ?? [];
  }

  @override
  String get jsonKey => RepositorySettings.notesKey;

  @override
  get deserializer => Note.fromJson;

  @override
  get sortItems => _sortItems;

  void addNote(DateTime date, String text) {
    addItem(Note.empty().copyWith(text: text, date: date));
  }

  void updateNote(String id, DateTime date, String text) {
    updateItem(
      id,
      (note) => note.copyWith(date: date, text: text),
    );
  }

  Note? getNote(DateTime date) {
    return state.firstWhereOrNull((note) => note.date.isSameDay(date));
  }

  void _sortItems() {
    state.sort((a, b) => b.date.compareTo(a.date));
  }
}

import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/repositories/repositories.dart';

part 'notes.g.dart';

@Riverpod(keepAlive: true)
class Notes extends _$Notes with ListState<Note>, SaveableList<Note> {
  @override
  ListRepository<Note> get repository => notesRepository;

  @override
  List<Note> build() {
    subscribe(ref);
    return notesRepository.state ?? [];
  }

  @override
  void invalidate() => ref.invalidateSelf();

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
}

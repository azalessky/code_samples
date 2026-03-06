import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:student_planner/models/models.dart';
import 'package:student_planner/common/utils/utils.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@freezed
abstract class Note with _$Note implements BaseObject, Comparable<Note> {
  const Note._();

  const factory Note({
    required String id,
    required DateTime date,
    required String text,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  factory Note.empty() => Note(
    id: ObjectId().value,
    date: DateHelper.todayUtc,
    text: '',
  );

  @override
  int compareTo(Note other) => date.compareTo(other.date);
}

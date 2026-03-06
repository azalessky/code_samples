import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:student_planner/models/models.dart';

part 'teacher.freezed.dart';
part 'teacher.g.dart';

@freezed
abstract class Teacher with _$Teacher implements BaseObject, Comparable<Teacher> {
  const Teacher._();

  const factory Teacher({
    required String id,
    required String name,
    required List<String> subjects,
    required String note,
    required String photo,
  }) = _Teacher;

  factory Teacher.fromJson(Map<String, dynamic> json) => _$TeacherFromJson({
    ...json,
    'photo': json['photo'] ?? '',
  });

  factory Teacher.empty() => Teacher(
    id: ObjectId().value,
    name: '',
    subjects: [],
    note: '',
    photo: '',
  );

  @override
  int compareTo(Teacher other) => name.compareTo(other.name);
}

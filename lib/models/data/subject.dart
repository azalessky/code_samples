import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_planner/models/models.dart';

part 'subject.freezed.dart';
part 'subject.g.dart';

@freezed
abstract class Subject with _$Subject implements BaseObject, Comparable<Subject> {
  const Subject._();

  const factory Subject({
    required String id,
    required String name,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);

  factory Subject.empty() => Subject(
    id: ObjectId().value,
    name: '',
  );

  @override
  int compareTo(Subject other) => name.compareTo(other.name);
}

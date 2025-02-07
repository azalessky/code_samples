import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:student_planner/models/models.dart';

part 'grade.freezed.dart';
part 'grade.g.dart';

enum GradeType { period, term }

@freezed
class Grade with _$Grade implements Serializable {
  const Grade._();

  const factory Grade({
    required String id,
    required String refId,
    required GradeType type,
    required DateTime date,
    required String subject,
    required List<GradeValue> values,
  }) = _Grade;

  factory Grade.fromJson(Map<String, dynamic> json) => _$GradeFromJson(json);

  factory Grade.empty() => Grade(
        id: ObjectId().value,
        refId: '',
        type: GradeType.period,
        date: DateTime.now(),
        subject: '',
        values: [],
      );

  factory Grade.fromPeriod(Period period, List<GradeValue> values) => Grade.empty().copyWith(
        refId: period.id,
        type: GradeType.period,
        date: period.date,
        subject: period.subject,
        values: values,
      );

  factory Grade.fromTerm(Term term, String subject, List<GradeValue> values) =>
      Grade.empty().copyWith(
        refId: term.id,
        type: GradeType.term,
        date: term.end,
        subject: subject,
        values: values,
      );

  bool get isEmpty => values.isEmpty;
  bool get isNotEmpty => values.isNotEmpty;

  String get valueText {
    final data = values.where((g) => g.value.isNotEmpty);
    return data.map((g) => g.value).join('/');
  }

  String get weightText {
    final data = values.where((g) => g.weight > 0);
    return data.map((g) => g.weight.toString()).join('/');
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:student_planner/models/models.dart';
import 'package:student_planner/common/utils/utils.dart';

part 'grade.freezed.dart';
part 'grade.g.dart';

enum GradeType { period, term }

@freezed
abstract class Grade with _$Grade implements BaseObject, Comparable<Grade> {
  const Grade._();

  const factory Grade({
    required String id,
    required String refId,
    required GradeType type,
    required DateTime date,
    required String subject,
    required List<GradeValue> values,
    required String attendance,
    required String comment,
  }) = _Grade;

  factory Grade.fromJson(Map<String, dynamic> json) => _$GradeFromJson({
    ...json,
    // TODO: Remove this after full migration to 2.28
    'attendance': json['attendance'] ?? '',
  });

  factory Grade.empty() => Grade(
    id: ObjectId().value,
    refId: '',
    type: GradeType.period,
    date: DateHelper.todayUtc,
    subject: '',
    values: [],
    attendance: '',
    comment: '',
  );

  factory Grade.withPeriod(Grade grade, Period period) => grade.copyWith(
    refId: period.id,
    type: GradeType.period,
    date: period.date,
    subject: period.subject,
  );

  factory Grade.fromTerm(Term term, String subject, List<GradeValue> values, String comment) =>
      Grade.empty().copyWith(
        refId: term.id,
        type: GradeType.term,
        date: term.end,
        subject: subject,
        values: values,
        comment: comment,
      );

  @override
  int compareTo(Grade other) => date.compareTo(other.date);

  bool get isEmpty => values.isEmpty && attendance.isEmpty;
  bool get isNotEmpty => !isEmpty;
}

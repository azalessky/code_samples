import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/models/models.dart';

part 'assignment.freezed.dart';
part 'assignment.g.dart';

enum AssignmentStatus {
  none,
  current,
  overdue,
  completed,
}

@freezed
class Assignment with _$Assignment implements Serializable {
  const Assignment._();

  const factory Assignment({
    required String id,
    required String refId,
    required DateTime date,
    required String subject,
    required String text,
    required List<String> images,
    required bool completed,
  }) = _Assignment;

  factory Assignment.fromJson(Map<String, dynamic> json) => _$AssignmentFromJson(json);

  factory Assignment.empty() => Assignment(
        id: ObjectId().value,
        refId: '',
        date: DateTime.now(),
        subject: '',
        text: '',
        images: [],
        completed: false,
      );

  factory Assignment.fromPeriod(Period period) => Assignment.empty().copyWith(
        refId: period.id,
        date: period.date,
        subject: period.subject,
      );

  AssignmentStatus get status {
    final today = DateTime.now();
    final todo = text.isNotEmpty && !completed;

    if (todo && (date.isSameDay(today) || date.isAfter(today))) {
      return AssignmentStatus.current;
    } else if (todo && (!date.isSameDay(today) || date.isBefore(today))) {
      return AssignmentStatus.overdue;
    } else if (completed) {
      return AssignmentStatus.completed;
    } else {
      return AssignmentStatus.none;
    }
  }
}

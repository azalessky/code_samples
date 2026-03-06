import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

part 'assignment.freezed.dart';
part 'assignment.g.dart';

enum AssignmentStatus {
  none,
  current,
  missed,
  completed,
  archived,
}

@freezed
abstract class Assignment with _$Assignment implements BaseObject, Comparable<Assignment> {
  const Assignment._();

  const factory Assignment({
    required String id,
    required String refId,
    required DateTime date,
    required String subject,
    required AssignmentContent content,
    required List<String> labels,
    required List<String> images,
    required bool completed,
    required bool archived,
  }) = _Assignment;

  factory Assignment.fromJson(Map<String, dynamic> json) => _$AssignmentFromJson(json);

  factory Assignment.empty() => Assignment(
    id: ObjectId().value,
    refId: '',
    date: DateHelper.todayUtc,
    subject: '',
    content: AssignmentContent.empty(),
    labels: [],
    images: [],
    completed: false,
    archived: false,
  );

  factory Assignment.fromPeriod(Period period) => Assignment.empty().copyWith(
    refId: period.id,
    date: period.date,
    subject: period.subject,
  );

  @override
  int compareTo(Assignment other) => date.compareTo(other.date);

  bool get isEmpty => content.isEmpty && images.isEmpty && labels.isEmpty;
  bool get isNotEmpty => !isEmpty;

  AssignmentStatus get status {
    final today = DateHelper.today;
    if (completed) {
      return AssignmentStatus.completed;
    } else if (archived) {
      return AssignmentStatus.archived;
    } else if (date.isSameDay(today) || date.isAfterDay(today)) {
      return AssignmentStatus.current;
    } else if (date.isBeforeDay(today)) {
      return AssignmentStatus.missed;
    } else {
      return AssignmentStatus.none;
    }
  }
}

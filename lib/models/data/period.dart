import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

part 'period.freezed.dart';
part 'period.g.dart';

@freezed
abstract class Period with _$Period implements BaseObject, Comparable<Period> {
  const Period._();

  const factory Period({
    required String id,
    required DateTime date,
    required int slot,
    required String subject,
    required String room,
    required String topic,
  }) = _Period;

  factory Period.fromJson(Map<String, dynamic> json) => _$PeriodFromJson({
    ...json,
    'room': json['room'] ?? '',
  });

  factory Period.empty() => Period(
    id: ObjectId().value,
    date: DateHelper.todayUtc,
    slot: 0,
    subject: '',
    room: '',
    topic: '',
  );

  factory Period.fromSlot(DateTime date, int slot) => Period.empty().copyWith(
    date: date,
    slot: slot,
  );

  @override
  int compareTo(Period other) {
    int diff = date.differenceInDays(other.date);
    return diff == 0 ? (slot - other.slot) : diff;
  }

  bool isSameSlot(DateTime dateOther, int slotOther) =>
      DateUtils.isSameDay(date, dateOther) && slot == slotOther;
}

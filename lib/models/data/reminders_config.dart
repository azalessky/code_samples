import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

part 'reminders_config.freezed.dart';
part 'reminders_config.g.dart';

enum ReminderTime {
  minutes5,
  minutes10,
  minutes15,
  minutes20,
}

@freezed
abstract class RemindersConfig with _$RemindersConfig {
  const RemindersConfig._();

  const factory RemindersConfig({
    required EnabledValue<ReminderTime> lessonStart,
    @TimeOfDayConverter() required EnabledValue<TimeOfDay> upcomingAssignments,
  }) = _RemindersConfig;

  factory RemindersConfig.fromJson(Map<String, dynamic> json) => _$RemindersConfigFromJson(json);

  factory RemindersConfig.empty() => RemindersConfig(
    lessonStart: DefaultConfig.lessonStart,
    upcomingAssignments: DefaultConfig.upcomingAssignments,
  );

  RemindersConfig withLessonStart({bool? enabled, ReminderTime? value}) {
    return copyWith(
      lessonStart: (
        enabled: enabled ?? lessonStart.enabled,
        value: value ?? lessonStart.value,
      ),
    );
  }

  RemindersConfig withUpcomingAssignments({bool? enabled, TimeOfDay? value}) {
    return copyWith(
      upcomingAssignments: (
        enabled: enabled ?? upcomingAssignments.enabled,
        value: value ?? upcomingAssignments.value,
      ),
    );
  }
}

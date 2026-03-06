import 'package:student_planner/models/models.dart';

extension RepeatScheduleExtension on RepeatSchedule {
  int get offsetDays => switch (this) {
    RepeatSchedule.weekly => 7,
    RepeatSchedule.biweekly => 14,
    RepeatSchedule.never => 0,
  };
}

extension ReminderTimeExtension on ReminderTime {
  int get offsetMinutes => switch (this) {
    ReminderTime.minutes5 => 5,
    ReminderTime.minutes10 => 10,
    ReminderTime.minutes15 => 15,
    ReminderTime.minutes20 => 20,
  };
}

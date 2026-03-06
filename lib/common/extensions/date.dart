import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:student_planner/common/common.dart';

extension DateTimeExtension on DateTime {
  DateTime get dateOnly => DateTime(year, month, day);
  DateTime get dateOnlyUtc => DateTime.utc(year, month, day);

  DateTime addSeconds(int seconds) => add(Duration(seconds: seconds));
  DateTime addMinutes(int minutes) => add(Duration(minutes: minutes));
  DateTime addDays(int days) => add(Duration(days: days));

  DateTime stripSeconds() => isUtc
      ? DateTime.utc(year, month, day, hour, minute)
      : DateTime(year, month, day, hour, minute);

  DateTime weekStart(List<int> weekdays) {
    int delta = (weekday - weekdays.first + 7) % 7;
    return subtract(Duration(days: delta));
  }

  DateTime weekEnd(List<int> weekdays) {
    int delta = (weekdays.last - weekday + 7) % 7;
    return add(Duration(days: delta));
  }

  DateTime monthStart(List<int> weekdays) {
    final start = DateTime.utc(year, month);
    int delta = (weekdays.first - start.weekday + 7) % 7;
    return start.add(Duration(days: delta));
  }

  TimeOfDay toTime() => TimeOfDay(hour: hour, minute: minute);

  DateTime withTime(TimeOfDay time) => DateTime(year, month, day, time.hour, time.minute);

  bool isAfterDay(DateTime other) {
    if (year != other.year) return year > other.year;
    if (month != other.month) return month > other.month;
    return day > other.day;
  }

  bool isBeforeDay(DateTime other) {
    if (year != other.year) return year < other.year;
    if (month != other.month) return month < other.month;
    return day < other.day;
  }

  bool isBetweenDays(DateTime start, DateTime end) {
    return !isBeforeDay(start) && !isAfterDay(end);
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isSameWeek(DateTime other, List<int> weekdays) {
    final start = weekStart(weekdays);
    final otherStart = other.weekStart(weekdays);
    return start.isSameDay(otherStart);
  }

  bool isSameMonth(DateTime other, List<int> weekdays) {
    final start = weekStart(weekdays).monthStart(weekdays);
    final otherStart = other.weekStart(weekdays).monthStart(weekdays);
    return start.isSameDay(otherStart);
  }

  int differenceInDays(DateTime other) {
    DateTime start = DateTime.utc(year, month, day);
    DateTime end = DateTime.utc(other.year, other.month, other.day);
    return start.difference(end).inDays;
  }

  String format(String pattern) {
    final locale = LocaleSettings.currentLocale.languageCode;
    return DateFormat(pattern, locale).format(this);
  }

  String formatUntil() {
    final today = DateHelper.today;
    final days = differenceInDays(today);
    return switch (days) {
      0 => t.dateFormat.today,
      1 => t.dateFormat.tomorrow,
      _ => format(
        today.year == year ? DateFormat.ABBR_MONTH_DAY : DateFormat.YEAR_ABBR_MONTH_DAY,
      ),
    };
  }
}

extension TimeofDayExtension on TimeOfDay {
  bool get isZero => hour == 0 && minute == 0;
  bool get isNotZero => !isZero;

  Duration difference(TimeOfDay other) =>
      Duration(minutes: hour * 60 + minute - other.hour * 60 - other.minute);

  TimeOfDay addMinutes(int minutes) {
    int total = hour * 60 + minute + minutes;
    return TimeOfDay(hour: (total ~/ 60) % 24, minute: total % 60);
  }

  DateTime nextOccurence() {
    final now = DateTime.now();
    var date = now.withTime(this);
    if (date.isBefore(now)) date = date.add(Duration(days: 1));
    return date;
  }
}

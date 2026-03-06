import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:student_planner/common/common.dart';

class DateHelper {
  static final minDate = DateTime(2000);
  static final maxDate = DateTime(2100);

  static DateTime get today => DateTime.now().dateOnly;
  static DateTime get todayUtc => DateTime.now().toUtc().dateOnlyUtc;

  static DateTime safeToday(List<int> weekdays) {
    final today = DateTime.now();
    final next = weekdays.firstWhere(
      (d) => d >= today.weekday,
      orElse: () => weekdays.first,
    );

    final delta = (next - today.weekday + 7) % 7;
    return DateTime.utc(today.year, today.month, today.day + delta);
  }

  static DateTime getDateForWeekday(DateTime date, int weekday) {
    return getDatesForWeekdays(date, [weekday]).first;
  }

  static List<DateTime> getDatesForWeekdays(DateTime date, List<int> weekdays) {
    DateTime weekStart = date.subtract(Duration(days: date.weekday - 1));
    return weekdays.map((weekday) => weekStart.add(Duration(days: weekday - 1))).toList();
  }

  static DateTime getCurrentWeekStart() {
    final date = todayUtc;
    return date.subtract(Duration(days: date.weekday - 1));
  }

  static String getAbbrNameOfWeekday(int weekday) {
    final date = getDateForWeekday(todayUtc, weekday);
    return date.format(DateFormat.ABBR_WEEKDAY).capitalized;
  }

  static List<String> getAbbrNamesOfWeekdays(List<int> weekdays) {
    return weekdays.map((day) => DateHelper.getAbbrNameOfWeekday(day)).toList();
  }

  static String getNameOfWeekday(int weekday) {
    final date = getDateForWeekday(todayUtc, weekday);
    return date.format(DateFormat.WEEKDAY).capitalized;
  }

  static List<String> getNamesOfWeekdays(BuildContext context) {
    return List.generate(
      DateTime.daysPerWeek,
      (index) => getNameOfWeekday(index + 1),
    );
  }

  static List<bool> weekdaysToMask(List<int> weekdays) {
    return List.generate(DateTime.daysPerWeek, (i) => weekdays.contains(i + 1));
  }

  static List<int> maskToWeekdays(List<bool> flags) {
    return flags.asMap().keys.where((i) => flags[i]).map((i) => i + 1).toList();
  }

  static String formatDateRange(DateTime start, DateTime end) {
    return DateUtils.isSameMonth(start, end)
        ? DateUtils.isSameDay(start, end)
              ? start.format(DateFormat.YEAR_MONTH_DAY)
              : t.dateFormat.range(
                  from: start.format(DateFormat.DAY),
                  to: end.format(DateFormat.YEAR_MONTH_DAY),
                )
        : t.dateFormat.range(
            from: start.format(DateFormat.MONTH_DAY),
            to: end.format(DateFormat.YEAR_MONTH_DAY),
          );
  }
}

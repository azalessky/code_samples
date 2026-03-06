import 'package:collection/collection.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

class ScheduleHelper {
  final ScheduleConfig config;

  const ScheduleHelper(this.config);

  List<Lesson> lessonList(
    List<Subject> subjects,
    List<Period> periods,
    List<Term> breaks,
    List<Bell> bells, {
    int maxDays = 30,
  }) {
    final now = DateTime.now();
    final maxDate = now.add(Duration(days: maxDays));
    final commonBells = config.bellSchedule == BellSchedule.common;
    final weekdays = config.classDays;

    return periods
        .map((p) {
          final bell = bells
              .where((b) => b.weekday == (commonBells ? 0 : p.date.weekday))
              .elementAtOrNull(p.slot);

          if (bell == null) return null;
          if (bell.start.isZero || bell.end.isZero) return null;

          if (!(p.date.isSameDay(now) || p.date.isAfterDay(now))) return null;
          if (p.date.isAfterDay(maxDate)) return null;
          if (p.subject.isEmpty) return null;

          if (!weekdays.contains(p.date.weekday)) return null;
          if (breaks.any((t) => p.date.isBetweenDays(t.start, t.end))) return null;

          final start = p.date.withTime(bell.start).toUtc();
          final end = p.date.withTime(bell.end).toUtc();

          return Lesson(
            id: p.id,
            start: start,
            end: end,
            subject: p.subject,
            room: p.room,
          );
        })
        .nonNulls
        .sorted()
        .toList();
  }
}

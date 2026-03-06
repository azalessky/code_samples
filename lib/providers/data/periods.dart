import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/repositories/repositories.dart';

part 'periods.g.dart';

@Riverpod(keepAlive: true)
class Periods extends _$Periods with ListState<Period>, SaveableList<Period> {
  static const repeatMaxWeeks = 52;

  @override
  ListRepository<Period> get repository => periodsRepository;

  @override
  List<Period> build() {
    ref.listen(
      settingsProvider.select((config) => config.schedule.repeatSchedule),
      (_, repeat) => _repeatPeriods(repeat),
    );
    subscribe(ref);
    return repository.state ?? [];
  }

  @override
  void invalidate() => ref.invalidateSelf();

  void updatePeriod(Period period, RepeatSchedule repeat) {
    setItem(period);
    _repeatItem(period, repeat, false);
  }

  void removePeriod(Period period, RepeatSchedule repeat) {
    removeItem(period.id);
    _repeatItem(period, repeat, true);
  }

  Period? getPeriod(DateTime date, int slot) {
    return state.firstWhereOrNull((p) => p.isSameSlot(date, slot));
  }

  List<Period?> getPeriods(DateTime date, int count) {
    return List<Period?>.generate(count, (index) => _getItem(date, index));
  }

  List<Period> getRange(DateTime start, DateTime end) {
    return state.where((p) => p.date.isBetweenDays(start, end)).toList();
  }

  List<Period> getFuture(String id, int count) {
    final current = getItem(id);
    if (current == null) return [];

    final today = DateHelper.todayUtc;
    final start = current.date.isBeforeDay(today) ? today : current.date;

    return state
        .where((p) {
          if (p.id == current.id) return false;
          if (p.subject != current.subject) return false;
          if (p.date.isAfterDay(start)) return true;

          if (p.date.isSameDay(start)) {
            if (start.isSameDay(today)) return true;
            return p.slot > current.slot;
          }
          return false;
        })
        .sorted()
        .take(count)
        .toList();
  }

  void _repeatPeriods(RepeatSchedule repeat) {
    final offset = repeat.offsetDays;
    final count = _repeatCount(repeat);
    final weekStart = DateHelper.getCurrentWeekStart();

    for (int i = 0; i < count; i++) {
      final start = weekStart.add(Duration(days: i * offset));
      final end = start.add(Duration(days: offset - 1));

      for (final period in getRange(start, end)) {
        _copyItem(period, period.date.addDays(offset));
      }
    }
  }

  int _repeatCount(RepeatSchedule repeat) {
    int offset = repeat.offsetDays;
    return offset == 0 ? 0 : repeatMaxWeeks ~/ (offset ~/ 7);
  }

  void _repeatItem(Period period, RepeatSchedule repeat, bool remove) {
    final offset = repeat.offsetDays;
    final count = _repeatCount(repeat);

    for (int i = 1; i <= count; i++) {
      final date = period.date.addDays(i * offset);
      if (remove) {
        final item = _getItem(date, period.slot);
        if (item != null) removeItem(item.id);
      } else {
        _copyItem(period, date);
      }
    }
  }

  void _copyItem(Period period, DateTime date) {
    final next = _getItem(date, period.slot) ?? Period.fromSlot(date, period.slot);
    final updated = next.copyWith(subject: period.subject, room: period.room);
    _setItem(updated);
  }

  Period? _getItem(DateTime date, int slot) {
    return state.firstWhereOrNull((p) => p.isSameSlot(date, slot));
  }

  void _setItem(Period period) {
    int index = state.indexWhere((p) => p.isSameSlot(period.date, period.slot));
    index < 0 ? state.add(period) : state[index] = period;
  }
}

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/repositories/repositories.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/common/common.dart';

part 'periods.g.dart';

@Riverpod(keepAlive: true)
class Periods extends _$Periods with SerializableList<Period> {
  static const repeatMaxWeeks = 52;

  @override
  List<Period> build() {
    return cachedRepository.getObjectList<Period>(this) ?? [];
  }

  @override
  String get jsonKey => RepositorySettings.periodsKey;

  @override
  get deserializer => Period.fromJson;

  @override
  get sortItems => _sortItems;

  void updatePeriod(Period period, [RepeatSchedule? repeat]) {
    setItem(period);
    if (repeat != null) _repeatItem(period, repeat);
  }

  Period? getPeriod(DateTime date, int slot) {
    return state.firstWhereOrNull((p) => p.isSameSlot(date, slot));
  }

  List<Period> getPeriods(DateTime date, int count) {
    return List<Period>.generate(count, (index) => _getItem(date, index));
  }

  List<Period> getRange(DateTime start, DateTime end) {
    return state.where((p) => p.date.inRange(start, end)).toList();
  }

  void repeatPeriods(RepeatSchedule repeat) {
    if (repeat != RepeatSchedule.never) {
      final today = DateUtils.dateOnly(DateTime.now());
      final start = today.add(Duration(days: 1 - today.weekday));
      final end = start.add(const Duration(days: 7));

      getRange(start, end).forEach((e) => _repeatItem(e, repeat));
    }
  }

  void _repeatItem(Period period, RepeatSchedule repeat) {
    if (repeat != RepeatSchedule.never) {
      final offset = switch (repeat) {
        RepeatSchedule.never => 0,
        RepeatSchedule.weekly => 7,
        RepeatSchedule.biweekly => 14,
      };
      final count = repeatMaxWeeks / (offset / 7);

      for (int i = 1; i <= count; i++) {
        final date = period.date.add(Duration(days: i * offset));
        final next = _getItem(date, period.slot);
        _setItem(next.copyWith(subject: period.subject));
      }
    }
  }

  Period _getItem(DateTime date, int slot) {
    return state.firstWhere(
      (p) => p.isSameSlot(date, slot),
      orElse: () => Period.empty().copyWith(date: date, slot: slot),
    );
  }

  void _setItem(Period period) {
    int index = state.indexWhere((p) => p.isSameSlot(period.date, period.slot));
    index < 0 ? state.add(period) : state[index] = period;
  }

  void _sortItems() {
    state.sort((a, b) {
      int diff = a.date.differenceInDays(b.date);
      return diff == 0 ? (a.slot - b.slot) : diff;
    });
  }
}

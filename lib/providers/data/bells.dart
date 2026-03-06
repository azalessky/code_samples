import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/repositories/repositories.dart';

part 'bells.g.dart';

@Riverpod(keepAlive: true)
class Bells extends _$Bells with ListState<Bell>, SaveableList<Bell> {
  @override
  ListRepository<Bell> get repository => bellsRepository;

  @override
  List<Bell> build() {
    ref.listen(
      settingsProvider.select((config) => config.schedule),
      (_, config) => setCount(config),
    );
    subscribe(ref);
    return repository.state ?? _defaultValue();
  }

  @override
  void invalidate() => ref.invalidateSelf();

  void setCount(ScheduleConfig config) {
    for (final day in [0, ...config.classDays]) {
      final bells = state.where((b) => b.weekday == day).toList();
      final count = config.periodCount;

      if (bells.length < count) {
        state.addAll(
          List.generate(
            count - bells.length,
            (index) => Bell.empty().copyWith(weekday: day),
          ),
        );
      } else if (bells.length > count) {
        state.removeWhere((b) => b.weekday == day && bells.indexOf(b) >= count);
      }
    }
    state = [...state];
  }

  List<Bell> getBells(int weekday) {
    return state.where((bell) => bell.weekday == weekday).toList();
  }

  Duration calcBreak(int weekday, int slot) {
    final bells = getBells(weekday);
    if (bells.isEmpty || slot >= bells.length - 1) return Duration.zero;

    final current = bells[slot];
    final next = bells[slot + 1];

    if (current.end.isZero || next.start.isZero) return Duration.zero;
    return next.start.difference(current.end);
  }

  List<Bell> _defaultValue() {
    return List.generate(DefaultConfig.periodCount, (index) => Bell.empty());
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';

part 'lessons.g.dart';

@Riverpod(keepAlive: true)
class Lessons extends _$Lessons {
  @override
  List<Lesson> build() {
    final config = ref.watch(settingsProvider.select((c) => c.schedule));
    final subjects = ref.watch(subjectsProvider);
    final periods = ref.watch(periodsProvider);
    final breaks = ref.watch(termsProvider.notifier).getBreaks();
    final bells = ref.watch(bellsProvider);

    return ScheduleHelper(config).lessonList(subjects, periods, breaks, bells);
  }
}

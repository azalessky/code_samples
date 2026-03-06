import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/managers/managers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';

class FocusManager {
  final WidgetRef ref;
  final _updateLock = AsyncLock();
  late final AppLifecycleListener _appListener;

  FocusManager(this.ref);

  Future<void> initialize() async {
    await _scheduleTasks();
  }

  void subscribe() {
    ref.listenManual(
      settingsProvider.select((c) => c.advanced.lessonMode),
      (_, _) => _scheduleTasks(),
    );
    ref.listenManual(lessonsProvider, (_, _) => _scheduleTasks());
    _appListener = AppLifecycleListener(onResume: _scheduleTasks);
  }

  void dispose() {
    _appListener.dispose();
  }

  Future<void> _scheduleTasks() async {
    await _updateLock.run(() async {
      final config = ref.read(settingsProvider).advanced;
      final lessons = ref.read(lessonsProvider);

      final tasks = _buildTaskList(config, lessons);

      if (tasks.isNotEmpty && tasks.first.mode == null) {
        await FocusTask(
          time: DateTime.now().toUtc(),
          mode: config.lessonMode.value,
        ).execute();
      }

      final data = FocusQueue(tasks: tasks);
      await data.serialize();
      await FocusScheduler.scheduleTask();
    });
  }

  List<FocusTask> _buildTaskList(AdvancedConfig config, List<Lesson> lessons) {
    final tasks = <FocusTask>[];
    final now = DateTime.now().toUtc().addSeconds(1);

    if (config.lessonMode.enabled) {
      for (final lesson in lessons) {
        final start = lesson.start;
        final end = lesson.end;

        if (start.isAfter(now)) {
          tasks.add(FocusTask(time: start, mode: config.lessonMode.value));
        }
        if (end.isAfter(now)) {
          tasks.add(FocusTask(time: end, mode: null));
        }
      }
    }
    return tasks.sorted();
  }
}

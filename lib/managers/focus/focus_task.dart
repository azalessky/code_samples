import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_planner/models/models.dart';
import 'package:student_planner/services/services.dart';

part 'focus_task.freezed.dart';
part 'focus_task.g.dart';

@freezed
abstract class FocusTask with _$FocusTask implements Comparable<FocusTask> {
  const FocusTask._();

  const factory FocusTask({
    required DateTime time,
    required LessonMode? mode,
  }) = _FocusTask;

  factory FocusTask.fromJson(Map<String, dynamic> json) => _$FocusTaskFromJson(json);

  @override
  int compareTo(FocusTask other) => time.compareTo(other.time);

  Future<void> execute() async {
    debugPrint('FocusTask.execute: $this');

    final focusMode = mode == null ? FocusMode.all : _focusMode(mode!);
    await FocusService.instance.setMode(focusMode);
  }

  FocusMode _focusMode(LessonMode mode) => switch (mode) {
    LessonMode.priority => FocusMode.priority,
    LessonMode.alarms => FocusMode.alarms,
    LessonMode.silent => FocusMode.none,
  };
}

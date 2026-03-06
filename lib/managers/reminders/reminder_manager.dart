import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/managers/managers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';

class ReminderManager {
  static const channelId = NotificationChannels.reminders;

  final WidgetRef ref;
  final _updateLock = AsyncLock();
  late final AppLifecycleListener _appListener;

  ReminderManager(this.ref);

  Future<void> initialize() async {
    await _createChannel();
    await _scheduleTasks();
  }

  void subscribe() {
    ref.listenManual(
      settingsProvider.select((c) => c.general.appLanguage),
      (_, _) => _scheduleTasks(),
    );
    ref.listenManual(
      settingsProvider.select((c) => c.reminders.lessonStart),
      (_, _) => _scheduleTasks(),
    );
    ref.listenManual(
      settingsProvider.select((c) => c.reminders.upcomingAssignments),
      (_, _) => _scheduleTasks(),
    );
    ref.listenManual(lessonsProvider, (_, _) => _scheduleTasks());
    ref.listenManual(assignmentsProvider, (_, _) => _scheduleTasks());

    _appListener = AppLifecycleListener(onResume: _scheduleTasks);
  }

  void dispose() {
    _appListener.dispose();
  }

  Future<void> _createChannel() async {
    final locale = AppLocaleUtils.findDeviceLocale();
    final channelName = locale.translations.notificationChannel.reminders;

    await NotificationService.createChannel(channelId, channelName);
  }

  Future<void> _scheduleTasks() async {
    await _updateLock.run(() async {
      final config = ref.read(settingsProvider).reminders;
      final lessons = ref.read(lessonsProvider);
      final assignments = ref.read(assignmentsProvider);

      final tasks = _buildTaskList(config, lessons, assignments);
      final data = ReminderQueue(tasks: tasks);
      await data.serialize();

      await ReminderScheduler.scheduleTask();
    });
  }

  List<ReminderTask> _buildTaskList(
    RemindersConfig config,
    List<Lesson> lessons,
    List<Assignment> assignments,
  ) {
    final tasks = <ReminderTask>[];

    if (config.lessonStart.enabled) {
      final offset = config.lessonStart.value.offsetMinutes;
      tasks.addAll(_lessonStartTasks(lessons, offset));
    }

    if (config.upcomingAssignments.enabled) {
      final occurence = config.upcomingAssignments.value.nextOccurence().toUtc();
      tasks.addAll(_upcomingAssignmentsTasks(assignments, occurence));
    }

    return tasks.sorted();
  }

  Iterable<ReminderTask> _lessonStartTasks(List<Lesson> lessons, int offset) sync* {
    final now = DateTime.now().toUtc().addSeconds(1);

    for (final lesson in lessons) {
      final time = lesson.start.addMinutes(-offset);
      if (time.isBefore(now)) continue;

      yield _lessonStartTask(lesson, time);
    }
  }

  ReminderTask _lessonStartTask(Lesson lesson, DateTime time) {
    return ReminderTask(
      time: time,
      title: t.notification.lessonStart.title(
        time: lesson.start.toLocal(),
        subject: lesson.subject,
      ),
      body: lesson.room.isNotEmpty ? t.notification.lessonStart.body(room: lesson.room) : null,
    );
  }

  Iterable<ReminderTask> _upcomingAssignmentsTasks(
    List<Assignment> assignments,
    DateTime occurence,
  ) sync* {
    final current = assignments.where((a) => a.status == AssignmentStatus.current).toList();
    if (current.isNotEmpty) {
      var time = occurence;
      final end = current.last.date.addDays(1);

      while (time.isBefore(end)) {
        final next = time.addDays(1);
        final list = current.where((a) => a.date.isSameDay(next));
        final subjects = list.map((a) => a.subject).toSet().toList().sorted();

        if (subjects.isNotEmpty) {
          yield _upcomingAssignmentsTask(subjects.join('\n'), time);
        }

        current.removeWhere((a) => a.date.isSameDay(time));
        time = next;
      }
    }
  }

  ReminderTask _upcomingAssignmentsTask(String body, DateTime time) {
    return ReminderTask(
      time: time,
      title: t.notification.upcomingAssignments.title,
      body: body,
    );
  }
}

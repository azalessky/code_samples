import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/managers/managers.dart';
import 'package:student_planner/services/services.dart';

@pragma('vm:entry-point')
Future<void> reminderCallback(int id, Map<String, dynamic> params) async {
  await NotificationService.initialize();
  await AndroidAlarmManager.initialize();
  await ReminderTask.fromJson(params).execute();
  await ReminderScheduler.scheduleTask();
}

class ReminderScheduler {
  static const alarmId = AlarmSettings.reminderAlarm;

  static Future<void> scheduleTask() async {
    await AndroidAlarmManager.cancel(alarmId);

    final data = await ReminderQueue.deserialize();
    if (data == null) return;

    final now = DateTime.now().toUtc();
    final task = data.tasks.firstWhereOrNull((t) => t.time.isAfter(now));
    if (task == null) return;

    debugPrint('ReminderScheduler.scheduleTask: $task');
    await _scheduleAlarm(task);
  }

  static Future<void> _scheduleAlarm(ReminderTask task) async {
    await AlarmService.scheduleAlarm(
      time: task.time.toLocal(),
      id: alarmId,
      callback: reminderCallback,
      params: task.toJson(),
    );
  }
}

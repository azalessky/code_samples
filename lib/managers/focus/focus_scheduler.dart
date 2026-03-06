import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/managers/managers.dart';
import 'package:student_planner/services/services.dart';

@pragma('vm:entry-point')
Future<void> focusCallback(int id, Map<String, dynamic> params) async {
  await AndroidAlarmManager.initialize();
  await FocusTask.fromJson(params).execute();
  await FocusScheduler.scheduleTask();
}

class FocusScheduler {
  static const alarmId = AlarmSettings.soundAlarm;

  static Future<void> scheduleTask() async {
    await AndroidAlarmManager.cancel(alarmId);

    final data = await FocusQueue.deserialize();
    if (data == null) return;

    final now = DateTime.now().toUtc();
    final task = data.tasks.firstWhereOrNull((t) => t.time.isAfter(now));
    if (task == null) return;

    debugPrint('FocusScheduler.scheduleTask: $task');
    await _scheduleAlarm(task);
  }

  static Future<void> _scheduleAlarm(FocusTask task) async {
    await AlarmService.scheduleAlarm(
      time: task.time.toLocal(),
      id: alarmId,
      callback: focusCallback,
      params: task.toJson(),
    );
  }
}

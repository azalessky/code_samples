import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

import 'package:student_planner/services/services.dart';

class AlarmService {
  static Future<void> scheduleAlarm({
    required DateTime time,
    required int id,
    required Function callback,
    Map<String, dynamic> params = const {},
  }) async {
    try {
      await AndroidAlarmManager.oneShotAt(
        time,
        id,
        callback,
        allowWhileIdle: true,
        exact: true,
        wakeup: true,
        rescheduleOnReboot: true,
        params: params,
      );
    } catch (e, st) {
      logError(e, st);
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/services/services.dart';

part 'reminder_task.freezed.dart';
part 'reminder_task.g.dart';

@freezed
abstract class ReminderTask with _$ReminderTask implements Comparable<ReminderTask> {
  static const channelId = NotificationChannels.reminders;

  const ReminderTask._();

  const factory ReminderTask({
    required DateTime time,
    required String title,
    required String? body,
  }) = _ReminderTask;

  factory ReminderTask.fromJson(Map<String, dynamic> json) => _$ReminderTaskFromJson(json);

  @override
  int compareTo(ReminderTask other) => time.compareTo(other.time);

  Future<void> execute() async {
    debugPrint('ReminderTask.execute: $this');

    await NotificationService.createChannel(channelId, 'default');
    await NotificationService.instance.show(
      channelId: channelId,
      id: time.hashCode,
      title: title,
      body: body,
    );
  }
}

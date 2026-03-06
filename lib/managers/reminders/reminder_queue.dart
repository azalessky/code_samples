import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/managers/managers.dart';

part 'reminder_queue.freezed.dart';
part 'reminder_queue.g.dart';

@freezed
abstract class ReminderQueue with _$ReminderQueue {
  static const prefsKey = PrefsKeys.remindersKey;

  const ReminderQueue._();

  const factory ReminderQueue({
    required List<ReminderTask> tasks,
  }) = _ReminderQueue;

  factory ReminderQueue.fromJson(Map<String, dynamic> json) => _$ReminderQueueFromJson(json);

  Future<void> serialize() async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(this);
    await prefs.setString(prefsKey, json);
  }

  static Future<ReminderQueue?> deserialize() async {
    final prefs = await SharedPreferences.getInstance();

    final value = prefs.getString(prefsKey);
    if (value == null) return null;

    try {
      final json = jsonDecode(value);
      return ReminderQueue.fromJson(json);
    } catch (_) {
      return null;
    }
  }
}

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/managers/managers.dart';

part 'focus_queue.freezed.dart';
part 'focus_queue.g.dart';

@freezed
abstract class FocusQueue with _$FocusQueue {
  static const prefsKey = PrefsKeys.focusKey;

  const FocusQueue._();

  const factory FocusQueue({
    required List<FocusTask> tasks,
  }) = _FocusQueue;

  factory FocusQueue.fromJson(Map<String, dynamic> json) => _$FocusQueueFromJson(json);

  Future<void> serialize() async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(this);
    await prefs.setString(prefsKey, json);
  }

  static Future<FocusQueue?> deserialize() async {
    final prefs = await SharedPreferences.getInstance();

    final value = prefs.getString(prefsKey);
    if (value == null) return null;

    try {
      final json = jsonDecode(value);
      return FocusQueue.fromJson(json);
    } catch (_) {
      return null;
    }
  }
}

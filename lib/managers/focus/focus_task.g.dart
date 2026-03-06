// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FocusTask _$FocusTaskFromJson(Map<String, dynamic> json) => _FocusTask(
  time: DateTime.parse(json['time'] as String),
  mode: $enumDecodeNullable(_$LessonModeEnumMap, json['mode']),
);

Map<String, dynamic> _$FocusTaskToJson(_FocusTask instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'mode': _$LessonModeEnumMap[instance.mode],
    };

const _$LessonModeEnumMap = {
  LessonMode.priority: 'priority',
  LessonMode.alarms: 'alarms',
  LessonMode.silent: 'silent',
};

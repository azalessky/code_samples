// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReminderTask _$ReminderTaskFromJson(Map<String, dynamic> json) =>
    _ReminderTask(
      time: DateTime.parse(json['time'] as String),
      title: json['title'] as String,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$ReminderTaskToJson(_ReminderTask instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'title': instance.title,
      'body': instance.body,
    };

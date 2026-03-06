// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_queue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReminderQueue _$ReminderQueueFromJson(Map<String, dynamic> json) =>
    _ReminderQueue(
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => ReminderTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReminderQueueToJson(_ReminderQueue instance) =>
    <String, dynamic>{'tasks': instance.tasks.map((e) => e.toJson()).toList()};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_queue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FocusQueue _$FocusQueueFromJson(Map<String, dynamic> json) => _FocusQueue(
  tasks: (json['tasks'] as List<dynamic>)
      .map((e) => FocusTask.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FocusQueueToJson(_FocusQueue instance) =>
    <String, dynamic>{'tasks': instance.tasks.map((e) => e.toJson()).toList()};

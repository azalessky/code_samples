// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Period _$PeriodFromJson(Map<String, dynamic> json) => _Period(
  id: json['id'] as String,
  date: DateTime.parse(json['date'] as String),
  slot: (json['slot'] as num).toInt(),
  subject: json['subject'] as String,
  room: json['room'] as String,
  topic: json['topic'] as String,
);

Map<String, dynamic> _$PeriodToJson(_Period instance) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date.toIso8601String(),
  'slot': instance.slot,
  'subject': instance.subject,
  'room': instance.room,
  'topic': instance.topic,
};

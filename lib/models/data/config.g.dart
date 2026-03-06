// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Config _$ConfigFromJson(Map<String, dynamic> json) => _Config(
  id: json['id'] as String,
  general: GeneralConfig.fromJson(json['general'] as Map<String, dynamic>),
  advanced: AdvancedConfig.fromJson(json['advanced'] as Map<String, dynamic>),
  reminders: RemindersConfig.fromJson(
    json['reminders'] as Map<String, dynamic>,
  ),
  schedule: ScheduleConfig.fromJson(json['schedule'] as Map<String, dynamic>),
  grades: GradesConfig.fromJson(json['grades'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ConfigToJson(_Config instance) => <String, dynamic>{
  'id': instance.id,
  'general': instance.general.toJson(),
  'advanced': instance.advanced.toJson(),
  'reminders': instance.reminders.toJson(),
  'schedule': instance.schedule.toJson(),
  'grades': instance.grades.toJson(),
};

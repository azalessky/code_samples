// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScheduleConfig _$ScheduleConfigFromJson(Map<String, dynamic> json) =>
    _ScheduleConfig(
      academicTerm: $enumDecode(_$AcademicTermEnumMap, json['academicTerm']),
      classDays: (json['classDays'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      periodCount: (json['periodCount'] as num).toInt(),
      repeatSchedule: $enumDecode(
        _$RepeatScheduleEnumMap,
        json['repeatSchedule'],
      ),
      bellSchedule: $enumDecode(_$BellScheduleEnumMap, json['bellSchedule']),
    );

Map<String, dynamic> _$ScheduleConfigToJson(_ScheduleConfig instance) =>
    <String, dynamic>{
      'academicTerm': _$AcademicTermEnumMap[instance.academicTerm]!,
      'classDays': instance.classDays,
      'periodCount': instance.periodCount,
      'repeatSchedule': _$RepeatScheduleEnumMap[instance.repeatSchedule]!,
      'bellSchedule': _$BellScheduleEnumMap[instance.bellSchedule]!,
    };

const _$AcademicTermEnumMap = {
  AcademicTerm.quarter: 'quarter',
  AcademicTerm.trimester: 'trimester',
  AcademicTerm.semester: 'semester',
};

const _$RepeatScheduleEnumMap = {
  RepeatSchedule.weekly: 'weekly',
  RepeatSchedule.biweekly: 'biweekly',
  RepeatSchedule.never: 'never',
};

const _$BellScheduleEnumMap = {
  BellSchedule.common: 'common',
  BellSchedule.daily: 'daily',
};

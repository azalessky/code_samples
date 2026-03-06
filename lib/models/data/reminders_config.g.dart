// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminders_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemindersConfig _$RemindersConfigFromJson(Map<String, dynamic> json) =>
    _RemindersConfig(
      lessonStart: _$recordConvert(
        json['lessonStart'],
        ($jsonValue) => (
          enabled: $jsonValue['enabled'] as bool,
          value: $enumDecode(_$ReminderTimeEnumMap, $jsonValue['value']),
        ),
      ),
      upcomingAssignments: _$recordConvert(
        json['upcomingAssignments'],
        ($jsonValue) => (
          enabled: $jsonValue['enabled'] as bool,
          value: const TimeOfDayConverter().fromJson(
            $jsonValue['value'] as String?,
          ),
        ),
      ),
    );

Map<String, dynamic> _$RemindersConfigToJson(_RemindersConfig instance) =>
    <String, dynamic>{
      'lessonStart': <String, dynamic>{
        'enabled': instance.lessonStart.enabled,
        'value': _$ReminderTimeEnumMap[instance.lessonStart.value]!,
      },
      'upcomingAssignments': <String, dynamic>{
        'enabled': instance.upcomingAssignments.enabled,
        'value': const TimeOfDayConverter().toJson(
          instance.upcomingAssignments.value,
        ),
      },
    };

const _$ReminderTimeEnumMap = {
  ReminderTime.minutes5: 'minutes5',
  ReminderTime.minutes10: 'minutes10',
  ReminderTime.minutes15: 'minutes15',
  ReminderTime.minutes20: 'minutes20',
};

$Rec _$recordConvert<$Rec>(Object? value, $Rec Function(Map) convert) =>
    convert(value as Map<String, dynamic>);

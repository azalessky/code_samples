// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advanced_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdvancedConfig _$AdvancedConfigFromJson(Map<String, dynamic> json) =>
    _AdvancedConfig(
      lessonMode: _$recordConvert(
        json['lessonMode'],
        ($jsonValue) => (
          enabled: $jsonValue['enabled'] as bool,
          value: $enumDecode(_$LessonModeEnumMap, $jsonValue['value']),
        ),
      ),
    );

Map<String, dynamic> _$AdvancedConfigToJson(_AdvancedConfig instance) =>
    <String, dynamic>{
      'lessonMode': <String, dynamic>{
        'enabled': instance.lessonMode.enabled,
        'value': _$LessonModeEnumMap[instance.lessonMode.value]!,
      },
    };

const _$LessonModeEnumMap = {
  LessonMode.priority: 'priority',
  LessonMode.alarms: 'alarms',
  LessonMode.silent: 'silent',
};

$Rec _$recordConvert<$Rec>(Object? value, $Rec Function(Map) convert) =>
    convert(value as Map<String, dynamic>);

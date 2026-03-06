// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grades_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GradesConfig _$GradesConfigFromJson(Map<String, dynamic> json) =>
    _GradesConfig(
      gradeScale: $enumDecode(_$GradeScaleEnumMap, json['gradeScale']),
      plusValue: (json['plusValue'] as num).toDouble(),
      minusValue: (json['minusValue'] as num).toDouble(),
      roundingThreshold: (json['roundingThreshold'] as num).toDouble(),
      roundingPrecision: (json['roundingPrecision'] as num).toInt(),
      gradeColors: (json['gradeColors'] as List<dynamic>)
          .map(
            (e) => _$recordConvert(
              e,
              ($jsonValue) => (
                color: const ColorConverter().fromJson(
                  $jsonValue['color'] as String?,
                ),
                from: ($jsonValue['from'] as num).toInt(),
                to: ($jsonValue['to'] as num).toInt(),
              ),
            ),
          )
          .toList(),
      attendanceMarks: (json['attendanceMarks'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GradesConfigToJson(_GradesConfig instance) =>
    <String, dynamic>{
      'gradeScale': _$GradeScaleEnumMap[instance.gradeScale]!,
      'plusValue': instance.plusValue,
      'minusValue': instance.minusValue,
      'roundingThreshold': instance.roundingThreshold,
      'roundingPrecision': instance.roundingPrecision,
      'gradeColors': instance.gradeColors
          .map(
            (e) => <String, dynamic>{
              'color': const ColorConverter().toJson(e.color),
              'from': e.from,
              'to': e.to,
            },
          )
          .toList(),
      'attendanceMarks': instance.attendanceMarks,
    };

const _$GradeScaleEnumMap = {
  GradeScale.numeric5: 'numeric5',
  GradeScale.numeric10: 'numeric10',
  GradeScale.numeric12: 'numeric12',
  GradeScale.numeric20: 'numeric20',
  GradeScale.numeric100: 'numeric100',
};

$Rec _$recordConvert<$Rec>(Object? value, $Rec Function(Map) convert) =>
    convert(value as Map<String, dynamic>);

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GradeValue _$GradeValueFromJson(Map<String, dynamic> json) => _GradeValue(
  value: json['value'] as String,
  weight: (json['weight'] as num).toDouble(),
);

Map<String, dynamic> _$GradeValueToJson(_GradeValue instance) =>
    <String, dynamic>{'value': instance.value, 'weight': instance.weight};

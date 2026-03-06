// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Grade _$GradeFromJson(Map<String, dynamic> json) => _Grade(
  id: json['id'] as String,
  refId: json['refId'] as String,
  type: $enumDecode(_$GradeTypeEnumMap, json['type']),
  date: DateTime.parse(json['date'] as String),
  subject: json['subject'] as String,
  values: (json['values'] as List<dynamic>)
      .map((e) => GradeValue.fromJson(e as Map<String, dynamic>))
      .toList(),
  attendance: json['attendance'] as String,
  comment: json['comment'] as String,
);

Map<String, dynamic> _$GradeToJson(_Grade instance) => <String, dynamic>{
  'id': instance.id,
  'refId': instance.refId,
  'type': _$GradeTypeEnumMap[instance.type]!,
  'date': instance.date.toIso8601String(),
  'subject': instance.subject,
  'values': instance.values.map((e) => e.toJson()).toList(),
  'attendance': instance.attendance,
  'comment': instance.comment,
};

const _$GradeTypeEnumMap = {GradeType.period: 'period', GradeType.term: 'term'};

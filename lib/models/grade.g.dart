// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GradeImpl _$$GradeImplFromJson(Map<String, dynamic> json) => _$GradeImpl(
      id: json['id'] as String,
      refId: json['refId'] as String,
      type: $enumDecode(_$GradeTypeEnumMap, json['type']),
      date: DateTime.parse(json['date'] as String),
      subject: json['subject'] as String,
      values: (json['values'] as List<dynamic>)
          .map((e) => GradeValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GradeImplToJson(_$GradeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'refId': instance.refId,
      'type': _$GradeTypeEnumMap[instance.type]!,
      'date': instance.date.toIso8601String(),
      'subject': instance.subject,
      'values': instance.values.map((e) => e.toJson()).toList(),
    };

const _$GradeTypeEnumMap = {
  GradeType.period: 'period',
  GradeType.term: 'term',
};

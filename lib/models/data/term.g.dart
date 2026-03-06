// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Term _$TermFromJson(Map<String, dynamic> json) => _Term(
  id: json['id'] as String,
  refId: json['refId'] as String,
  type: $enumDecode(_$TermTypeEnumMap, json['type']),
  name: json['name'] as String,
  start: DateTime.parse(json['start'] as String),
  end: DateTime.parse(json['end'] as String),
);

Map<String, dynamic> _$TermToJson(_Term instance) => <String, dynamic>{
  'id': instance.id,
  'refId': instance.refId,
  'type': _$TermTypeEnumMap[instance.type]!,
  'name': instance.name,
  'start': instance.start.toIso8601String(),
  'end': instance.end.toIso8601String(),
};

const _$TermTypeEnumMap = {
  TermType.year: 'year',
  TermType.study: 'study',
  TermType.vacation: 'vacation',
  TermType.holiday: 'holiday',
};

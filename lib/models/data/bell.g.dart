// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Bell _$BellFromJson(Map<String, dynamic> json) => _Bell(
  id: json['id'] as String,
  weekday: (json['weekday'] as num).toInt(),
  start: const TimeOfDayConverter().fromJson(json['start'] as String?),
  end: const TimeOfDayConverter().fromJson(json['end'] as String?),
);

Map<String, dynamic> _$BellToJson(_Bell instance) => <String, dynamic>{
  'id': instance.id,
  'weekday': instance.weekday,
  'start': const TimeOfDayConverter().toJson(instance.start),
  'end': const TimeOfDayConverter().toJson(instance.end),
};

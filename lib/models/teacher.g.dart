// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeacherImpl _$$TeacherImplFromJson(Map<String, dynamic> json) =>
    _$TeacherImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      subjects:
          (json['subjects'] as List<dynamic>).map((e) => e as String).toList(),
      note: json['note'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$$TeacherImplToJson(_$TeacherImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subjects': instance.subjects,
      'note': instance.note,
      'avatar': instance.avatar,
    };

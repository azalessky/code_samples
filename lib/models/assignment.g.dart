// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssignmentImpl _$$AssignmentImplFromJson(Map<String, dynamic> json) =>
    _$AssignmentImpl(
      id: json['id'] as String,
      refId: json['refId'] as String,
      date: DateTime.parse(json['date'] as String),
      subject: json['subject'] as String,
      text: json['text'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$$AssignmentImplToJson(_$AssignmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'refId': instance.refId,
      'date': instance.date.toIso8601String(),
      'subject': instance.subject,
      'text': instance.text,
      'images': instance.images,
      'completed': instance.completed,
    };

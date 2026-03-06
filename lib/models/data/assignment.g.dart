// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Assignment _$AssignmentFromJson(Map<String, dynamic> json) => _Assignment(
  id: json['id'] as String,
  refId: json['refId'] as String,
  date: DateTime.parse(json['date'] as String),
  subject: json['subject'] as String,
  content: AssignmentContent.fromJson(json['content'] as Map<String, dynamic>),
  labels: (json['labels'] as List<dynamic>).map((e) => e as String).toList(),
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  completed: json['completed'] as bool,
  archived: json['archived'] as bool,
);

Map<String, dynamic> _$AssignmentToJson(_Assignment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'refId': instance.refId,
      'date': instance.date.toIso8601String(),
      'subject': instance.subject,
      'content': instance.content.toJson(),
      'labels': instance.labels,
      'images': instance.images,
      'completed': instance.completed,
      'archived': instance.archived,
    };

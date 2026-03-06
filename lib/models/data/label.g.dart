// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'label.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Label _$LabelFromJson(Map<String, dynamic> json) => _Label(
  id: json['id'] as String,
  name: json['name'] as String,
  color: const ColorConverter().fromJson(json['color'] as String?),
);

Map<String, dynamic> _$LabelToJson(_Label instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'color': const ColorConverter().toJson(instance.color),
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextContent _$TextContentFromJson(Map<String, dynamic> json) =>
    TextContent(json['text'] as String, $type: json['type'] as String?);

Map<String, dynamic> _$TextContentToJson(TextContent instance) =>
    <String, dynamic>{'text': instance.text, 'type': instance.$type};

ListContent _$ListContentFromJson(Map<String, dynamic> json) => ListContent(
  (json['items'] as List<dynamic>)
      .map(
        (e) => _$recordConvert(
          e,
          ($jsonValue) => (
            checked: $jsonValue['checked'] as bool,
            text: $jsonValue['text'] as String,
          ),
        ),
      )
      .toList(),
  $type: json['type'] as String?,
);

Map<String, dynamic> _$ListContentToJson(ListContent instance) =>
    <String, dynamic>{
      'items': instance.items
          .map((e) => <String, dynamic>{'checked': e.checked, 'text': e.text})
          .toList(),
      'type': instance.$type,
    };

$Rec _$recordConvert<$Rec>(Object? value, $Rec Function(Map) convert) =>
    convert(value as Map<String, dynamic>);

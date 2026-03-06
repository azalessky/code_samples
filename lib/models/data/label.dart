import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_planner/models/models.dart';

part 'label.freezed.dart';
part 'label.g.dart';

@freezed
abstract class Label with _$Label implements BaseObject, Comparable<Label> {
  const Label._();

  const factory Label({
    required String id,
    required String name,
    @ColorConverter() required Color color,
  }) = _Label;

  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);

  factory Label.empty() => Label(
    id: ObjectId().value,
    name: '',
    color: Colors.transparent,
  );

  @override
  int compareTo(Label other) => name.compareTo(other.name);
}

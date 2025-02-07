import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_planner/models/models.dart';

part 'bell.freezed.dart';
part 'bell.g.dart';

@freezed
class Bell with _$Bell implements Serializable {
  static const zeroTime = TimeOfDay(hour: 0, minute: 0);

  const factory Bell({
    required String id,
    @TimeOfDayConverter() required TimeOfDay start,
    @TimeOfDayConverter() required TimeOfDay end,
  }) = _Bell;

  factory Bell.fromJson(Map<String, dynamic> json) => _$BellFromJson(json);

  factory Bell.empty() => Bell(
        id: ObjectId().value,
        start: zeroTime,
        end: zeroTime,
      );
}

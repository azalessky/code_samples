import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

part 'grades_config.freezed.dart';
part 'grades_config.g.dart';

enum GradeScale {
  numeric5,
  numeric10,
  numeric12,
  numeric20,
  numeric100,
}

@freezed
abstract class GradesConfig with _$GradesConfig {
  const factory GradesConfig({
    required GradeScale gradeScale,
    required double plusValue,
    required double minusValue,
    required double roundingThreshold,
    required int roundingPrecision,
    @ColorConverter() required List<ColorRange> gradeColors,
    required List<String> attendanceMarks,
  }) = _GradesConfig;

  factory GradesConfig.fromJson(Map<String, dynamic> json) => _$GradesConfigFromJson({
    ...json,
    // TODO: Remove this after full migration to 2.28
    'attendanceMarks': json['attendanceMarks'] ?? json['attendanceCodes'] ?? [],
  });

  factory GradesConfig.empty() => GradesConfig(
    gradeScale: DefaultConfig.gradeScale,
    plusValue: DefaultConfig.plusValue,
    minusValue: DefaultConfig.minusValue,
    roundingThreshold: DefaultConfig.roundingThreshold,
    roundingPrecision: DefaultConfig.roundingPrecision,
    gradeColors: DefaultConfig.gradeColors,
    attendanceMarks: [],
  );
}

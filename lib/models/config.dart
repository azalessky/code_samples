import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

part 'config.freezed.dart';
part 'config.g.dart';

enum RepeatSchedule {
  weekly,
  biweekly,
  never,
}

enum GradingScale {
  numeric,
  alphabetic,
}

@freezed
class Config with _$Config implements Serializable {
  const factory Config({
    required String id,
    required ThemeMode themeMode,
    @ColorConverter() required Color colorTheme,
    required String backgroundImage,
    required StudyWeek studyWeek,
    required GradingScale gradingScale,
    required int periodCount,
    required RepeatSchedule repeatSchedule,
  }) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  factory Config.empty() => Config(
        id: ObjectId().value,
        themeMode: DefaultSettings.themeMode,
        colorTheme: DefaultSettings.colorTheme,
        backgroundImage: DefaultSettings.backgroundImage,
        studyWeek: StudyWeek(days: DefaultSettings.studyWeek),
        gradingScale: DefaultSettings.gradingScale,
        periodCount: DefaultSettings.periodCount,
        repeatSchedule: RepeatSchedule.never,
      );
}

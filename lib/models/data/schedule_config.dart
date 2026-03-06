import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_planner/common/common.dart';

part 'schedule_config.freezed.dart';
part 'schedule_config.g.dart';

enum RepeatSchedule { weekly, biweekly, never }

enum BellSchedule { common, daily }

enum AcademicTerm { quarter, trimester, semester }

@freezed
abstract class ScheduleConfig with _$ScheduleConfig {
  const factory ScheduleConfig({
    required AcademicTerm academicTerm,
    required List<int> classDays,
    required int periodCount,
    required RepeatSchedule repeatSchedule,
    required BellSchedule bellSchedule,
  }) = _ScheduleConfig;

  factory ScheduleConfig.fromJson(Map<String, dynamic> json) => _$ScheduleConfigFromJson(json);

  factory ScheduleConfig.empty() => ScheduleConfig(
    academicTerm: DefaultConfig.academicTerm,
    classDays: DefaultConfig.classDays,
    periodCount: DefaultConfig.periodCount,
    repeatSchedule: DefaultConfig.repeatSchedule,
    bellSchedule: DefaultConfig.bellSchedule,
  );
}

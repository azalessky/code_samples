import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

part 'advanced_config.freezed.dart';
part 'advanced_config.g.dart';

enum LessonMode { priority, alarms, silent }

@freezed
abstract class AdvancedConfig with _$AdvancedConfig {
  const AdvancedConfig._();

  const factory AdvancedConfig({
    required EnabledValue<LessonMode> lessonMode,
  }) = _AdvancedConfig;

  factory AdvancedConfig.fromJson(Map<String, dynamic> json) => _$AdvancedConfigFromJson(json);

  factory AdvancedConfig.empty() => AdvancedConfig(
    lessonMode: DefaultConfig.lessonMode,
  );

  AdvancedConfig withLessonMode({bool? enabled, LessonMode? value}) {
    return copyWith(
      lessonMode: (
        enabled: enabled ?? lessonMode.enabled,
        value: value ?? lessonMode.value,
      ),
    );
  }
}

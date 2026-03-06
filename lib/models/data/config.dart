import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_planner/models/models.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@freezed
abstract class Config with _$Config implements BaseObject {
  const factory Config({
    required String id,
    required GeneralConfig general,
    required AdvancedConfig advanced,
    required RemindersConfig reminders,
    required ScheduleConfig schedule,
    required GradesConfig grades,
  }) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson({
    ...json,
    // TODO: Remove this class after full migration to 2.25
    'advanced': json['advanced'] ?? AdvancedConfig.empty().toJson(),
  });

  factory Config.empty() => Config(
    id: ObjectId().value,
    general: GeneralConfig.empty(),
    advanced: AdvancedConfig.empty(),
    reminders: RemindersConfig.empty(),
    schedule: ScheduleConfig.empty(),
    grades: GradesConfig.empty(),
  );
}

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/repositories/repositories.dart';

part 'settings.g.dart';

@Riverpod(keepAlive: true)
class Settings extends _$Settings with SaveableObject<Config> {
  @override
  ObjectRepository<Config> get repository => settingsRepository;

  @override
  Config build() {
    subscribe(ref);
    return settingsRepository.state ?? _defaultValue();
  }

  @override
  void invalidate() => ref.invalidateSelf();

  set general(GeneralConfig value) => state = state.copyWith(general: value);
  set advanced(AdvancedConfig value) => state = state.copyWith(advanced: value);
  set reminders(RemindersConfig value) => state = state.copyWith(reminders: value);
  set schedule(ScheduleConfig value) => state = state.copyWith(schedule: value);
  set grades(GradesConfig value) => state = state.copyWith(grades: value);

  Config _defaultValue() {
    final data = resources.getAttendances(LocaleHelper.deviceLocale);
    return Config.empty().copyWith.grades(attendanceMarks: data);
  }
}

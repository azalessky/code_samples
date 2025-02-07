import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/repositories/repositories.dart';
import 'package:student_planner/models/models.dart';

part 'settings.g.dart';

@Riverpod(keepAlive: true)
class Settings extends _$Settings with SerializableObject<Config> {
  @override
  Config build() {
    return cachedRepository.getObject<Config>(this) ?? Config.empty();
  }

  @override
  String get jsonKey => RepositorySettings.settingsKey;

  @override
  get deserializer => Config.fromJson;

  set themeMode(ThemeMode value) {
    state = state.copyWith(themeMode: value);
  }

  set colorTheme(Color value) {
    state = state.copyWith(colorTheme: value);
  }

  set backgroundImage(String value) {
    state = state.copyWith(backgroundImage: value);
  }

  set studyWeek(StudyWeek value) {
    state = state.copyWith(studyWeek: value);
  }

  set periodCount(int value) {
    state = state.copyWith(periodCount: value);
  }

  set repeatSchedule(RepeatSchedule value) {
    state = state.copyWith(repeatSchedule: value);
  }

  set gradingScale(GradingScale value) {
    state = state.copyWith(gradingScale: value);
  }
}

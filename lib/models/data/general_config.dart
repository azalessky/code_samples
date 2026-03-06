import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

part 'general_config.freezed.dart';
part 'general_config.g.dart';

@freezed
abstract class GeneralConfig with _$GeneralConfig {
  const factory GeneralConfig({
    required String appLanguage,
    required ThemeMode themeMode,
    @ColorConverter() required Color baseColor,
    required String backgroundImage,
    required String appFont,
  }) = _GeneralConfig;

  factory GeneralConfig.fromJson(Map<String, dynamic> json) => _$GeneralConfigFromJson(json);

  factory GeneralConfig.empty() => GeneralConfig(
    appLanguage: LocaleHelper.deviceLocale,
    themeMode: DefaultConfig.themeMode,
    baseColor: DefaultConfig.baseColor,
    backgroundImage: DefaultConfig.backgroundImage,
    appFont: DefaultConfig.appFont,
  );
}

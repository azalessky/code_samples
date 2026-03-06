// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeneralConfig _$GeneralConfigFromJson(Map<String, dynamic> json) =>
    _GeneralConfig(
      appLanguage: json['appLanguage'] as String,
      themeMode: $enumDecode(_$ThemeModeEnumMap, json['themeMode']),
      baseColor: const ColorConverter().fromJson(json['baseColor'] as String?),
      backgroundImage: json['backgroundImage'] as String,
      appFont: json['appFont'] as String,
    );

Map<String, dynamic> _$GeneralConfigToJson(_GeneralConfig instance) =>
    <String, dynamic>{
      'appLanguage': instance.appLanguage,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'baseColor': const ColorConverter().toJson(instance.baseColor),
      'backgroundImage': instance.backgroundImage,
      'appFont': instance.appFont,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

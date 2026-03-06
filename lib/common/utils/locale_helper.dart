import 'package:student_planner/common/common.dart';

class LocaleHelper {
  static const languageNames = {
    'en': 'English',
    'ru': 'Русский',
    'uk': 'Українська',
  };

  static List<String> get supportedLocales =>
      AppLocaleUtils.supportedLocales.map((locale) => locale.languageCode).toList();

  static String get deviceLocale => AppLocaleUtils.findDeviceLocale().languageCode;
}

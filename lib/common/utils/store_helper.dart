import 'dart:io';

import 'package:student_planner/common/common.dart';

class StoreHelper {
  static String get shareLink => Platform.isAndroid
      ? packageInfo.isRuStore
            ? ruStoreWeb
            : googlePlayWeb
      : appStoreWeb;

  static String get directLink => Platform.isAndroid
      ? packageInfo.isRuStore
            ? ruStoreDirect
            : googlePlayDirect
      : appStoreDirect;

  static String get googlePlayWeb =>
      'https://play.google.com/store/apps/details?id=${AppSettings.packageName}';
  static String get googlePlayDirect => 'market://details?id=${AppSettings.packageName}';

  static String get ruStoreWeb => 'https://apps.rustore.ru/app/${AppSettings.packageName}';
  static String get ruStoreDirect => 'rustore://store/app/${AppSettings.packageName}';

  static String get appStoreWeb => 'https://apps.apple.com/app/id${AppSettings.appleId}';
  static String get appStoreDirect => 'itms-apps://apps.apple.com/app/id${AppSettings.appleId}';
}

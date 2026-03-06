import 'package:package_info_plus/package_info_plus.dart';

extension PackageInfoExtension on PackageInfo {
  bool get isLocalSource => installerStore == null;
  bool get isPackageInstaller => installerStore == 'com.google.android.packageinstaller';
  bool get isGooglePlay => installerStore == 'com.android.vending';
  bool get isRuStore => installerStore == 'ru.vk.store';
}

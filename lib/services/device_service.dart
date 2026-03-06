import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceService {
  static final DeviceService instance = DeviceService._();
  final DeviceInfoPlugin _plugin = DeviceInfoPlugin();

  String? _deviceModel;
  String? _systemVersion;

  DeviceService._();

  String get deviceModel => _deviceModel ?? '';
  String get systemVersion => _systemVersion ?? '';

  static Future<void> initialize() async {
    final info = instance._plugin;

    if (Platform.isAndroid) {
      final androidInfo = await info.androidInfo;
      instance._setInfo(androidInfo.model, 'Android ${androidInfo.version.release}');
      return;
    }

    if (Platform.isIOS) {
      final iosInfo = await info.iosInfo;
      instance._setInfo(iosInfo.utsname.machine, '${iosInfo.systemName} ${iosInfo.systemVersion}');
      return;
    }
  }

  void _setInfo(String deviceModel, String systemVersion) {
    _deviceModel = deviceModel;
    _systemVersion = systemVersion;
  }
}

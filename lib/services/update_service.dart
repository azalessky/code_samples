import 'dart:io';

import 'package:in_app_update/in_app_update.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/services/services.dart';

class UpdateService {
  const UpdateService._();

  static final instance = UpdateService._();

  Future<void> checkForUpdate() async {
    if (AppSettings.isProduction && Platform.isAndroid) {
      _logEvent(AnalyticsEvent.updateCheck);
      await _checkGooglePlayUpdate();
    }
  }

  Future<void> _checkGooglePlayUpdate() async {
    try {
      final info = await InAppUpdate.checkForUpdate();
      if (info.updateAvailability != UpdateAvailability.updateAvailable) return;

      if (info.flexibleUpdateAllowed) {
        final result = await InAppUpdate.startFlexibleUpdate();
        if (result == AppUpdateResult.success) {
          _logEvent(AnalyticsEvent.updateInstall, {'type': 'flexible'});
          await InAppUpdate.completeFlexibleUpdate();
        }
      } else if (info.immediateUpdateAllowed) {
        _logEvent(AnalyticsEvent.updateInstall, {'type': 'immediate'});
        await InAppUpdate.performImmediateUpdate();
      }
    } catch (e, st) {
      logError(e, st);
    }
  }

  Future<void> _logEvent(AnalyticsEvent event, [Map<String, String>? params]) async {
    final usageDays = DateTime.now().difference(packageInfo.installTime!).inDays;

    await logEvent(event, {
      'installer_store': packageInfo.installerStore ?? 'unknown',
      'usage_days': usageDays,
      ...?params,
    });
  }
}

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:in_app_update/in_app_update.dart';

import 'package:student_planner/common/common.dart';

class UpdateService {
  static Future<void> checkForUpdate() async {
    try {
      if (AppSettings.isProduction && Platform.isAndroid) {
        final info = await InAppUpdate.checkForUpdate();
        if (info.updateAvailability == UpdateAvailability.updateAvailable &&
            info.flexibleUpdateAllowed) {
          final result = await InAppUpdate.startFlexibleUpdate();
          if (result == AppUpdateResult.success) {
            await InAppUpdate.completeFlexibleUpdate();
          }
        }
      }
    } catch (e) {
      debugPrint('UpdateService: $e');
    }
  }
}

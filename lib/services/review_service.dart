import 'dart:io';

import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/services/services.dart';

class ReviewService {
  static const storageKey = PrefsKeys.reviewKey;

  static Future<void> requestReview({
    Duration delay = AnimationSettings.dialogDuration,
    int minDays = 3,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateHelper.todayUtc;

    await Future.delayed(delay);

    final request = prefs.getInt(storageKey);
    if (request == null) {
      await prefs.setInt(storageKey, now.millisecondsSinceEpoch);
      return;
    }

    final date = DateTime.fromMillisecondsSinceEpoch(request, isUtc: true);
    if (now.difference(date).inDays < minDays) return;

    if (AppSettings.isProduction && Platform.isAndroid) {
      logEvent(AnalyticsEvent.userRateApp);

      await _reviewGooglePlay();
      await prefs.setInt(storageKey, now.millisecondsSinceEpoch);
    }
  }

  static Future<void> _reviewGooglePlay() async {
    try {
      final isAvailable = await InAppReview.instance.isAvailable();
      if (isAvailable) await InAppReview.instance.requestReview();
    } catch (e, st) {
      logError(e, st);
    }
  }
}

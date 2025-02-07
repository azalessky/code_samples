import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

enum AnalyticsEvent {
  assignmentsShowList,
  assignmentsMarkCompleted,
  assignmentsShowItem,
  assignmentsUpdateItem,
  assignmentsPickImage,
  assignmentsViewImage,
  assignmentsDeleteImage,
  assignmentsShareText,
  assignmentsShareImages,
  notesUpdateItem,
  notesDeleteItem,
  subjectsShowList,
  subjectsUpdateItem,
  subjectsDeleteItem,
  subjectsResetItems,
  teachersShowList,
  teachersUpdateItem,
  teachersDeleteItem,
  termsShowList,
  termsUpdateItem,
  termsDeleteItem,
  bellsShowList,
  bellsUpdateItem,
  gradesSwitchView,
  gradesShowBook,
  gradesShowReport,
  gradesShowHistory,
  gradesSelectGrade,
  scheduleResetScroll,
  scheduleSelectSubject,
  scheduleSelectGrade,
  subscriptionsShowList,
  subscriptionsPurchase,
  subscriptionsCancel,
  subscriptionsResume,
  userSignIn,
  userSignOut,
  settingsDeleteProfile,
  settingsUpdate,
  syncDataUpdated,
}

class AnalyticsService {
  final analytics = FirebaseAnalytics.instance;

  Future<void> logEvent(AnalyticsEvent event) async {
    final name = _camelToSnake(event.name);

    try {
      await analytics.logEvent(name: name);
      debugPrint('logEvent: event=$name');
    } catch (e) {
      debugPrint('logEvent: $e}');
    }
  }

  String _camelToSnake(String str) {
    final regex = RegExp(r'(?<=[a-z])(?=[A-Z])');
    return str.split(regex).join('_').toLowerCase();
  }
}

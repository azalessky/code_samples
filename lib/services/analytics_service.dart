import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';

enum AnalyticsEvent {
  assignmentsUpdateItem,
  assignmentsDeleteItem,
  assignmentsArchiveItem,
  assignmentsCompleteItem,
  assignmentsShareContent,
  assignmentsAddImage,
  assignmentsDeleteImage,
  assignmentsAddLabel,
  assignmentsAddText,
  assignmentsAddList,
  labelsUpdateItem,
  labelsDeleteItem,
  labelsResetItems,
  notesUpdateItem,
  notesDeleteItem,
  subjectsUpdateItem,
  subjectsDeleteItem,
  subjectsResetItems,
  teachersUpdateItem,
  teachersDeleteItem,
  termsUpdateItem,
  termsDeleteItem,
  bellsUpdateItem,
  gradesUpdateItem,
  gradesDeleteItem,
  lessonsUpdateItem,
  lessonsDeleteItem,
  lessonsShareContent,
  settingsUpdate,
  userDeleteProfile,
  userRateApp,
  userSignIn,
  userSignInAnonymously,
  userSignOut,
  updateCheck,
  updateInstall,
  deepLinkOpen,
}

final logEvent = AnalyticsService.instance.logEvent;
final logError = AnalyticsService.instance.logError;
final logScreen = AnalyticsService.instance.logScreen;

class AnalyticsService {
  static final instance = AnalyticsService._();

  final _auth = FirebaseAuth.instance;
  final _analytics = FirebaseAnalytics.instance;
  final _crashlytics = FirebaseCrashlytics.instance;
  late final StreamSubscription _authSubscription;

  AnalyticsService._();

  static void initialize() {
    instance._authSubscription = instance._auth.authStateChanges().listen(
      (User? user) => instance._crashlytics.setUserIdentifier(user?.uid ?? ''),
    );
  }

  static void dispose() {
    instance._authSubscription.cancel();
  }

  Future<void> logEvent(AnalyticsEvent event, [Map<String, Object>? params]) async {
    try {
      final eventName = event.name.toSeparated('_');
      final debugLog = params?.isNotEmpty == true ? '$eventName $params' : eventName;

      debugPrint('AnalyticsService.logEvent: $debugLog');
      if (Firebase.apps.isEmpty) return;

      await _analytics.logEvent(name: eventName, parameters: params);
    } catch (e, st) {
      debugPrint('AnalyticsService.logEvent: $e');
      logError(e, st);
    }
  }

  Future<void> logError(dynamic exception, StackTrace? stack) async {
    debugPrint('AnalyticsService.logError: $exception\n$stack');
    if (Firebase.apps.isEmpty) return;

    await _crashlytics.recordError(exception, stack);
  }

  Future<void> logScreen(String routeName) async {
    final screenName = routeName.replaceAll(RegExp(r'(Route|View)$'), '').toSeparated('-');
    final screenClass = routeName;

    debugPrint('AnalyticsService.logScreen: $screenName');
    if (Firebase.apps.isEmpty) return;

    await _analytics.logScreenView(screenName: screenName, screenClass: screenClass);
  }
}

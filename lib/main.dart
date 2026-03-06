import 'dart:async';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/providers/providers.dart' hide Settings;
import 'package:student_planner/services/services.dart';

import 'firebase_options.dart';

void main() async {
  runZonedGuarded(
    () async {
      await initializeApp().measured('initializeApp');
      UpdateService.instance.checkForUpdate();
      runApp(MainApp());
    },
    (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    },
  );
}

Future<void> initializeApp() async {
  initializeWidgets();
  await LocaleSettings.useDeviceLocale();
  await initializeFirebase();
  await initializeServices();
  await Dependencies.initialize();
  await profileManager.restoreSession();
}

void initializeWidgets() {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseAppCheck.instance.activate(
    providerAndroid: AppSettings.isProduction
        ? AndroidPlayIntegrityProvider()
        : AndroidDebugProvider(debugToken: AppSettings.debugToken),
    providerApple: AppSettings.isProduction
        ? AppleDeviceCheckProvider()
        : AppleDebugProvider(debugToken: AppSettings.debugToken),
  );

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(kReleaseMode);
  await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(kReleaseMode);
  await GoogleSignIn.instance.initialize();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}

Future<void> initializeServices() async {
  AnalyticsService.initialize();
  await DeviceService.initialize();
  await AuthService.initialize();
  await AndroidAlarmManager.initialize();
  await NotificationService.initialize();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UncontrolledProviderScope(
      container: providerContainer,
      child: Consumer(
        builder: (context, ref, _) => _buildApp(context, ref),
      ),
    );
  }

  Widget _buildApp(BuildContext context, WidgetRef ref) {
    final config = ref.watch(settingsProvider.select((c) => c.general));
    final router = ref.watch(routerProvider);

    final lightTheme = Themes.lightTheme(config);
    final darkTheme = Themes.darkTheme(config);

    return Localization(
      language: config.appLanguage,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: Locale(config.appLanguage),
        onGenerateTitle: (_) => t.app.title,
        themeMode: config.themeMode,
        theme: lightTheme,
        darkTheme: darkTheme,
        scaffoldMessengerKey: messages.globalKey,
        routerConfig: router.configuration,
      ),
    );
  }
}

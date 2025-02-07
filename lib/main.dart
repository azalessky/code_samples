import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_rustore_billing/flutter_rustore_billing.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/common/common.dart';
import 'package:student_planner/styles/styles.dart';
import 'package:student_planner/helpers/helpers.dart';

import 'firebase_options.dart';

void main() async {
  runZonedGuarded(() async {
    await initializeApp();

    runApp(
      Localization(
        child: MainApp(routes: Routes()),
      ),
    );
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  });
}

Future<void> initializeApp() async {
  await initializeWidgets();
  await Localization.initialize();
  await initializeFirebase();
  await Dependencies.initialize();
}

Future<void> initializeWidgets() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  await GoogleFonts.pendingFonts([GoogleFonts.lato()]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(kReleaseMode);
  await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(kReleaseMode);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}

Future<void> initializePayments() async {
  if (Platform.isAndroid) {
    await RustoreBillingClient.initialize(
      RustoreSettings.appId,
      RustoreSettings.appDeepLink,
      kDebugMode,
    );
  }
}

class MainApp extends StatelessWidget {
  final Routes routes;

  const MainApp({required this.routes, super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (context, ref, _) => _buildApp(context, ref),
      ),
    );
  }

  Widget _buildApp(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateTitle: (_) => 'App.Title'.tr(),
      themeMode: settings.themeMode,
      theme: themes.lightTheme(settings.colorTheme, settings.backgroundImage.isNotEmpty),
      darkTheme: themes.darkTheme(settings.colorTheme, settings.backgroundImage.isNotEmpty),
      scaffoldMessengerKey: getIt<MessengerHelper>().messengerKey,
      routerConfig: routes.configuration,
    );
  }
}

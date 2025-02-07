import 'package:get_it/get_it.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/styles/styles.dart';
import 'package:student_planner/repositories/repositories.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/features/shared/shared.dart';

final getIt = GetIt.I;

final cachedRepository = getIt<CachedRepository>();
final serializableManager = getIt<SerializableManager>();

final resources = getIt<Resources>();
final themes = getIt<Themes>();

final showSnackBar = getIt<MessengerHelper>().showSnackBar;
final logEvent = getIt<AnalyticsService>().logEvent;

final authService = getIt<AuthService>();
final subscriptionService = getIt<SubscriptionService>();
final profileManager = getIt<ProfileManager>();
final subscriptionManager = getIt<SubscriptionManager>();

class Dependencies {
  static Future<void> initialize() async {
    getIt.registerSingletonAsync<Resources>(
      () => Resources.getInstance(),
    );
    getIt.registerSingletonAsync<CachedRepository>(
      () => CachedRepository.getInstance(
        AppSettings.isProduction
            ? RepositorySettings.remoteKeyProd
            : RepositorySettings.remoteKeyDev,
      ),
      dispose: (instance) => instance.dispose(),
    );
    getIt.registerSingleton<SerializableManager>(SerializableManager());
    getIt.registerSingleton<Themes>(Themes());
    getIt.registerSingleton<AnalyticsService>(AnalyticsService());
    getIt.registerSingleton<MessengerHelper>(MessengerHelper());
    getIt.registerSingleton<AuthService>(AuthService());
    getIt.registerSingleton<SubscriptionService>(SubscriptionService());
    getIt.registerSingleton<ProfileManager>(ProfileManager());
    getIt.registerSingleton<SubscriptionManager>(SubscriptionManager());

    await getIt.allReady();
  }
}

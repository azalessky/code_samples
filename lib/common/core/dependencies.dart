import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/managers/managers.dart';

final getIt = GetIt.I;

final providerContainer = ProviderContainer();
final profileManager = getIt<ProfileManager>();

final resources = getIt<Resources>();
final messages = getIt<Messages>();
final packageInfo = getIt<PackageInfo>();

class Dependencies {
  static Future<void> initialize() async {
    getIt.registerSingletonAsync<Resources>(() => Resources.getInstance());
    getIt.registerSingleton<Messages>(Messages());
    getIt.registerSingletonAsync<PackageInfo>(() => PackageInfo.fromPlatform());
    getIt.registerSingleton<ProfileManager>(
      ProfileManager.getInstance(providerContainer),
      dispose: (instance) => instance.dispose(),
    );
    await getIt.allReady();
  }
}

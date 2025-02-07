import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/repositories/repositories.dart';
import 'package:student_planner/styles/styles.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/features/shared/shared.dart';
import 'package:student_planner/features/home/home.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  StreamSubscription<RepositoryEvent>? subscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadProfile();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);

    return Stack(
      children: [
        Positioned.fill(
          child: BackgroundImage(
            background: Background(settings.backgroundImage),
          ),
        ),
        AutoTabsScaffold(
          routes: const [
            ScheduleRoute(),
            AssignmentsRoute(),
            BellsRoute(),
            GradesRoute(),
            ProfileRoute(),
          ],
          bottomNavigationBuilder: (_, tabsRouter) => Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
              ),
            ),
            child: BottomNavBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
            ),
          ),
        ),
      ],
    );
  }

  void _loadProfile() async {
    subscription = cachedRepository.updates.listen(_handleDataUpdate);
    await profileManager.loadData(context);
  }

  void _handleDataUpdate(RepositoryEvent event) async {
    switch (event) {
      case RepositoryEvent.dataUpdated:
        logEvent(AnalyticsEvent.syncDataUpdated);
        showSnackBar(SnackBarStyle.info, 'Message.DataUpdated'.tr());
        break;
      case RepositoryEvent.userDeleted:
        profileManager.deleteData(context, false);
        break;
    }
  }
}

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide FocusManager;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/features/home/home.dart';
import 'package:student_planner/managers/managers.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final PermissionManager _permissionManager;
  late final FocusManager _focusManager;
  late final ReminderManager _reminderManager;
  late final HomeWidgetManager _homeWidgetUpdater;

  @override
  void initState() {
    super.initState();

    Future.microtask(() => _initManagers());
    UpdateInfoManager.showDialog();
  }

  @override
  void dispose() {
    _permissionManager.dispose();
    _focusManager.dispose();
    _reminderManager.dispose();
    _homeWidgetUpdater.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const routes = [
      ScheduleRoute(),
      AssignmentsRoute(),
      BellsRoute(),
      GradesRoute(),
      ProfileRoute(),
    ];

    final config = ref.watch(settingsProvider.select((c) => c.general));

    return Stack(
      children: [
        Positioned.fill(
          child: BackgroundImage(
            background: Background(config.backgroundImage),
          ),
        ),
        AutoTabsScaffold(
          routes: routes,
          bottomNavigationBuilder: (_, tabsRouter) => BottomNavBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
          ),
        ),
      ],
    );
  }

  Future<void> _initManagers() async {
    await profileManager.checkUser();

    _permissionManager = PermissionManager(ref);
    await _permissionManager.initialize();
    _permissionManager.subscribe();

    _focusManager = FocusManager(ref);
    await _focusManager.initialize();
    _focusManager.subscribe();

    _reminderManager = ReminderManager(ref);
    await _reminderManager.initialize();
    _reminderManager.subscribe();

    _homeWidgetUpdater = HomeWidgetManager(ref);
    _homeWidgetUpdater.subscribe();
  }
}

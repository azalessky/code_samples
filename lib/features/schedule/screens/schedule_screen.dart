import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/features/schedule/schedule.dart';

class ScheduleTabs {
  static void showScheduleDaily(BuildContext context) {
    return AutoTabsRouter.of(context).setActiveIndex(0);
  }

  static void showScheduleWeekly(BuildContext context) {
    return AutoTabsRouter.of(context).setActiveIndex(1);
  }
}

@RoutePage()
class ScheduleScreen extends ConsumerStatefulWidget {
  const ScheduleScreen({super.key});

  @override
  ConsumerState<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends ConsumerState<ScheduleScreen> {
  late DateTime _initialDate;
  ScheduleController? _scheduleController;

  @override
  void initState() {
    super.initState();

    ref.listenManual(
      settingsProvider.select((config) => config.schedule.classDays),
      (_, classDays) => setState(() => _updateController(classDays)),
      fireImmediately: true,
    );
  }

  @override
  void dispose() {
    _scheduleController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        DailyScheduleRoute(
          initialDate: _initialDate,
          controller: _scheduleController!.dailyController,
        ),
        WeeklyScheduleRoute(
          initialDate: _initialDate,
          controller: _scheduleController!.weeklyController,
        ),
      ],
      builder: (_, child) => child,
    );
  }

  void _updateController(List<int> classDays) {
    _initialDate = DateHelper.safeToday(classDays);
    _scheduleController?.dispose();
    _scheduleController = ScheduleController(
      position: _initialDate,
      weekdays: classDays,
    );
  }
}

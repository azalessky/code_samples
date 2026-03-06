import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/features/bells/bells.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class BellsScreen extends ConsumerWidget {
  const BellsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(settingsProvider.select((c) => c.schedule));
    final weekdays = config.classDays;
    final today = DateHelper.safeToday(weekdays);

    return DefaultTabController(
      length: config.classDays.length,
      initialIndex: config.bellSchedule == BellSchedule.daily ? weekdays.indexOf(today.weekday) : 0,
      child: BackgroundScaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(t.bellsScreen.title),
          bottom: config.bellSchedule == BellSchedule.daily
              ? _buildTabBar(context, weekdays)
              : null,
        ),
        body: config.bellSchedule == BellSchedule.daily ? _buildTabBarView(weekdays) : BellsView(),
      ),
    );
  }

  PreferredSizeWidget _buildTabBar(BuildContext context, List<int> weekdays) {
    return ButtonTabBar(
      tabs: weekdays
          .map(
            (day) => Tab(
              child: context.textMedium(
                DateHelper.getAbbrNameOfWeekday(day).toUpperCase(),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildTabBarView(List<int> weekdays) {
    return TabBarView(
      children: weekdays.map((day) => BellsView(weekday: day)).toList(),
    );
  }
}

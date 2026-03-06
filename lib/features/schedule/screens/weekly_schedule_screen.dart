import 'package:auto_route/auto_route.dart';
import 'package:date_tab_pager/date_tab_pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/features/schedule/schedule.dart';

@RoutePage()
class WeeklyScheduleScreen extends ConsumerStatefulWidget {
  static const tabBarHeight = 48.0;
  static const adaptiveWidth = 400.0;
  static const adaptivePadding = EdgeInsets.symmetric(horizontal: 8);

  final DateTime initialDate;
  final PositionController controller;

  const WeeklyScheduleScreen({
    super.key,
    required this.initialDate,
    required this.controller,
  });

  @override
  ConsumerState<WeeklyScheduleScreen> createState() => _ScheduleWeeklyScreenState();
}

class _ScheduleWeeklyScreenState extends ConsumerState<WeeklyScheduleScreen>
    with TickerProviderStateMixin {
  final _sync = SyncController();

  @override
  void dispose() {
    _sync.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final labelPadding = screenWidth < WeeklyScheduleScreen.adaptiveWidth
        ? WeeklyScheduleScreen.adaptivePadding
        : null;

    return BaseScheduleScreen(
      initialDate: widget.initialDate,
      tabBuilder: (_, onDateChanged) => WeeklyTabBar(
        key: ValueKey(widget.controller.weekdays),
        controller: widget.controller,
        sync: _sync,
        height: WeeklyScheduleScreen.tabBarHeight,
        labelPadding: labelPadding,
        tabBuilder: _buildTab,
        onTabScrolled: (value) {
          final date = value.isSameMonth(widget.controller.position, widget.controller.weekdays)
              ? widget.controller.position
              : value;
          onDateChanged(date);
        },
        onTabChanged: (value) => onDateChanged(value),
      ),
      bodyBuilder: (_, _) => WeeklyTabView(
        key: ValueKey(widget.controller.weekdays),
        controller: widget.controller,
        sync: _sync,
        pageBuilder: (_, date) =>
            ScheduleWeeklyView(DateHelper.getDatesForWeekdays(date, widget.controller.weekdays)),
      ),
      actionButton: IconButton(
        onPressed: () => ScheduleTabs.showScheduleDaily(context),
        icon: Icon(Icons.view_week_outlined),
      ),
      samePeriod: (date, other) => date.isSameMonth(other, widget.controller.weekdays),
      onResetPosition: () => widget.controller.animateTo(widget.initialDate),
    );
  }

  Widget _buildTab(BuildContext context, DateTime date) {
    final start = date.weekStart(widget.controller.weekdays);
    final end = date.weekEnd(widget.controller.weekdays);

    return Center(
      child: Text(
        '${start.day}–${end.day}',
        overflow: .ellipsis,
        style: context.textTheme.titleSmall,
      ),
    );
  }
}

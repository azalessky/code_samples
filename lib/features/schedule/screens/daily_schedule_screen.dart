import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:date_tab_pager/date_tab_pager.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/features/schedule/schedule.dart';

@RoutePage()
class DailyScheduleScreen extends ConsumerStatefulWidget {
  static const tabBarHeight = 72.0;

  final DateTime initialDate;
  final PositionController controller;

  const DailyScheduleScreen({
    super.key,
    required this.initialDate,
    required this.controller,
  });

  @override
  ConsumerState<DailyScheduleScreen> createState() => _ScheduleDailyScreenState();
}

class _ScheduleDailyScreenState extends ConsumerState<DailyScheduleScreen>
    with TickerProviderStateMixin {
  final _sync = SyncController();

  @override
  void dispose() {
    _sync.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScheduleScreen(
      initialDate: widget.initialDate,
      tabBuilder: (_, onDateChanged) => DailyTabBar(
        key: ValueKey(widget.controller.weekdays),
        controller: widget.controller,
        sync: _sync,
        height: DailyScheduleScreen.tabBarHeight,
        tabBuilder: _buildTab,
        onTabScrolled: (value) {
          final date = value.isSameWeek(widget.controller.position, widget.controller.weekdays)
              ? widget.controller.position
              : value;
          onDateChanged(date);
        },
        onTabChanged: (value) => onDateChanged(value),
      ),
      bodyBuilder: (_, _) => DailyTabView(
        key: ValueKey(widget.controller.weekdays),
        controller: widget.controller,
        sync: _sync,
        pageBuilder: (_, date) => ScheduleDailyView(date),
      ),
      actionButton: IconButton(
        onPressed: () => ScheduleTabs.showScheduleWeekly(context),
        icon: Icon(Icons.calendar_view_month_outlined),
      ),
      samePeriod: (date, other) => date.isSameWeek(other, widget.controller.weekdays),
      onResetPosition: () => widget.controller.animateTo(widget.initialDate),
    );
  }

  Widget _buildTab(BuildContext context, DateTime date) {
    final overrideStyle = ref.read(termsProvider.notifier).getBreak(date) != null;
    final overrideColor = Theme.of(context).colorScheme.error;

    final baseStyle = context.textTheme.titleSmall!;
    final textStyle = overrideStyle ? baseStyle.copyWith(color: overrideColor) : baseStyle;

    final weekdayText = DateHelper.getAbbrNameOfWeekday(date.weekday).toUpperCase();
    final dayText = date.day.toString();

    return Column(
      mainAxisAlignment: .center,
      children: [
        Text(weekdayText, softWrap: false, style: textStyle),
        FormLayout.tinySpacer,
        Text(dayText, softWrap: false, style: textStyle),
      ],
    );
  }
}

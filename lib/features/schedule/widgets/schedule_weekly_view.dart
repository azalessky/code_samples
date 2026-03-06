import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/features/schedule/schedule.dart';

class ScheduleWeeklyView extends ConsumerWidget {
  final List<DateTime> dates;

  const ScheduleWeeklyView(this.dates, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(periodsProvider);
    ref.watch(termsProvider);

    final config = ref.watch(settingsProvider.select((c) => c.schedule));

    return SingleChildScrollView(
      child: Column(
        children: [
          FormLayout.sectionSpacer,
          _buildSchedule(context, ref, config.classDays),
          FormLayout.sectionSpacer,
        ],
      ),
    );
  }

  Widget _buildSchedule(BuildContext context, WidgetRef ref, List<int> weekdays) {
    return Column(
      spacing: FormLayout.tableSpacing,
      children: [
        for (var i = 0; i < weekdays.length; i += 2)
          Row(
            crossAxisAlignment: .start,
            children: [
              Expanded(child: _buildTable(context, ref, i)),
              if (i + 1 < weekdays.length)
                Expanded(child: _buildTable(context, ref, i + 1))
              else
                const Spacer(),
            ],
          ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, DateTime date) {
    final padding = EdgeInsets.symmetric(vertical: 4 + (Platform.isIOS ? 2 : 0));
    final borderColor = Theme.of(context).colorScheme.outline;
    final border = BorderSide(color: borderColor);

    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(top: border, left: border, right: border),
      ),
      child: Padding(
        padding: padding,
        child: context.titleSmall(
          date.format(DateFormat.WEEKDAY).capitalized,
        ),
      ),
    );
  }

  Widget _buildTable(BuildContext context, WidgetRef ref, int index) {
    final date = dates[index];
    final holiday = ref.read(termsProvider.notifier).getBreak(date);
    final periodCount = ref.read(settingsProvider).schedule.periodCount;
    final periods = ref.read(periodsProvider.notifier).getPeriods(date, periodCount);

    final table = ScheduleTable(date: date, periods: periods, compact: true);
    final column = Column(
      children: [
        _buildHeader(context, date),
        holiday == null ? table : _buildHoliday(context, holiday, table),
      ],
    );

    final padding = const EdgeInsets.symmetric(horizontal: FormLayout.tableSpacing / 2);
    return Padding(padding: padding, child: column);
  }

  Widget _buildHoliday(BuildContext context, Term holiday, Widget table) {
    return MeasuredFrame(
      color: Theme.of(context).colorScheme.outline,
      reference: table,
      content: HolidayPlaceholder(holiday: holiday, compact: true),
    );
  }
}

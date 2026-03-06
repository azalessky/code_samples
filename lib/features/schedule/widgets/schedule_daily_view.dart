import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/features/schedule/schedule.dart';

class ScheduleDailyView extends ConsumerWidget {
  final DateTime date;

  const ScheduleDailyView(this.date, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(periodsProvider);
    ref.watch(termsProvider);
    ref.watch(notesProvider);

    final config = ref.watch(settingsProvider.select((c) => c.schedule));
    final holiday = ref.read(termsProvider.notifier).getBreak(date);
    final periods = ref.read(periodsProvider.notifier).getPeriods(date, config.periodCount);

    return holiday == null ? _buildSchedule(periods) : HolidayPlaceholder(holiday: holiday);
  }

  Widget _buildSchedule(List<Period?> periods) {
    final padding = const EdgeInsets.symmetric(horizontal: FormLayout.tableSpacing / 2);

    return SingleChildScrollView(
      primary: true,
      child: Column(
        children: [
          FormLayout.sectionSpacer,
          Padding(
            padding: padding,
            child: ScheduleTable(date: date, periods: periods),
          ),
          FormLayout.largeSpacer,
          NoteSection(date: date, hintText: t.scheduleScreen.noteHint),
          FormLayout.sectionSpacer,
        ],
      ),
    );
  }
}

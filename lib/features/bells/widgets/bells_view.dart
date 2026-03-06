import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

class BellsView extends ConsumerWidget {
  final int weekday;

  const BellsView({
    this.weekday = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(bellsProvider);

    final notifier = ref.read(bellsProvider.notifier);
    final bells = notifier.getBells(weekday);

    return FlexibleTable(
      rowCount: bells.length,
      columns: [
        FlexibleColumn(
          title: t.bellsScreen.period,
          width: FlexColumnWidth(),
        ),
        FlexibleColumn(
          title: t.bellsScreen.start,
          width: FlexColumnWidth(),
          onTap: (row) => _selectStartTime(context, ref, row, bells[row]),
        ),
        FlexibleColumn(
          title: t.bellsScreen.end,
          width: FlexColumnWidth(),
          onTap: (row) => _selectEndTime(context, ref, row, bells[row]),
        ),
        FlexibleColumn(
          title: t.bellsScreen.kBreak,
          width: FlexColumnWidth(),
        ),
      ],
      textBuilder: (column, row) => switch (column) {
        0 => (row + 1).toString(),
        1 => _formatTime(context, bells[row].start),
        2 => _formatTime(context, bells[row].end),
        3 => _formatDuration(notifier.calcBreak(weekday, row)),
        _ => '',
      },
    );
  }

  String _formatTime(BuildContext context, TimeOfDay time) {
    return time.isZero ? '—' : time.format(context);
  }

  String _formatDuration(Duration duration) {
    return duration.inMinutes > 0 ? t.bellsScreen.breakText(minutes: duration.inMinutes) : '';
  }

  void _selectStartTime(BuildContext context, WidgetRef ref, int index, Bell bell) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: bell.start,
    );
    if (time != null) {
      _updateBell(ref, bell.copyWith(start: time));
    }
  }

  void _selectEndTime(BuildContext context, WidgetRef ref, int index, Bell bell) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: bell.end,
    );
    if (time != null) {
      _updateBell(ref, bell.copyWith(end: time));
    }
  }

  void _updateBell(WidgetRef ref, Bell bell) {
    logEvent(AnalyticsEvent.bellsUpdateItem);

    ref.read(bellsProvider.notifier).setItem(bell);
    ref.read(bellsProvider.notifier).save();
  }
}

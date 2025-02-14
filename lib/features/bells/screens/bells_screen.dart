import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/features/shared/shared.dart';

@RoutePage()
class BellsScreen extends ConsumerStatefulWidget {
  const BellsScreen({super.key});

  @override
  ConsumerState<BellsScreen> createState() => _BellsScreenState();
}

class _BellsScreenState extends ConsumerState<BellsScreen> {
  @override
  Widget build(BuildContext context) {
    logEvent(AnalyticsEvent.bellsShowList);

    final bells = ref.watch(bellsProvider);
    final notifier = ref.read(bellsProvider.notifier);

    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BellsScreen.Title'.tr()),
      ),
      body: FlexibleTable(
        rowCount: bells.length,
        columns: [
          FlexibleColumn(
            title: 'BellsScreen.Period'.tr(),
            width: 0,
            align: TextAlign.center,
          ),
          FlexibleColumn(
            title: 'BellsScreen.Start'.tr(),
            width: 0,
            align: TextAlign.center,
            onTap: (row) => _selectStartTime(context, row, bells[row]),
          ),
          FlexibleColumn(
            title: 'BellsScreen.End'.tr(),
            width: 0,
            align: TextAlign.center,
            onTap: (row) => _selectEndTime(context, row, bells[row]),
          ),
          FlexibleColumn(
            title: 'BellsScreen.Recess'.tr(),
            width: 0,
            align: TextAlign.center,
          ),
        ],
        textBuilder: (column, row) => switch (column) {
          0 => (row + 1).toString(),
          1 => _formatTime(context, bells[row].start),
          2 => _formatTime(context, bells[row].end),
          3 => _formatDuration(notifier.calcRecess(row)),
          _ => ''
        },
      ),
    );
  }

  String _formatTime(BuildContext context, TimeOfDay time) {
    return time.isZero ? '—' : time.format(context);
  }

  String _formatDuration(Duration duration) {
    return duration.inMinutes > 0
        ? 'BellsScreen.RecessText'.tr(args: [duration.inMinutes.toString()])
        : '';
  }

  void _selectStartTime(BuildContext context, int index, Bell bell) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: bell.start,
    );
    if (time != null) {
      _updateBell(bell.copyWith(start: time));
    }
  }

  void _selectEndTime(BuildContext context, int index, Bell bell) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: bell.end,
    );
    if (time != null) {
      _updateBell(bell.copyWith(end: time));
    }
  }

  void _updateBell(Bell bell) {
    logEvent(AnalyticsEvent.bellsUpdateItem);
    ref.read(bellsProvider.notifier).setItem(bell);
    cachedRepository.saveData();
  }
}

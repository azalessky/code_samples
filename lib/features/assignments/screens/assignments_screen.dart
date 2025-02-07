import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/features/assignments/assignments.dart';
import 'package:student_planner/features/shared/shared.dart';

@RoutePage()
class AssignmentsScreen extends ConsumerStatefulWidget {
  const AssignmentsScreen({super.key});

  @override
  ConsumerState<AssignmentsScreen> createState() => _AssignmentsScreenState();
}

class _AssignmentsScreenState extends ConsumerState<AssignmentsScreen>
    with TickerProviderStateMixin {
  final filters = [AssignmentStatus.current, AssignmentStatus.overdue];
  late AppLifecycleListener appListener;
  late Map<AssignmentStatus, List<Assignment>> assignments;
  var selectedStatus = AssignmentStatus.current;

  @override
  void initState() {
    super.initState();
    appListener = AppLifecycleListener(onResume: () => _updateState());
    ref.listenManual(assignmentsProvider, (_, __) => _updateState(), fireImmediately: true);
  }

  @override
  void dispose() {
    appListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    logEvent(AnalyticsEvent.assignmentsShowList);
    final count = assignments.values.fold(0, (sum, list) => sum + list.length);

    return DefaultTabController(
      length: assignments.keys.length,
      child: BackgroundScaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('AssignmentsScreen.Title').tr(),
          bottom: count > 0
              ? AssignmentsTabBar(
                  assignments: assignments,
                  onSelected: (status) => selectedStatus = status,
                )
              : null,
        ),
        body: count > 0
            ? _buildTabBarView(context)
            : SpacePlaceholder(text: 'AssignmentsScreen.NoData'.tr()),
      ),
    );
  }

  Widget _buildTabBarView(BuildContext context) {
    return TabBarView(
      children: assignments.keys
          .map(
            (status) => _buildAssignmentList(assignments[status]!),
          )
          .toList(),
    );
  }

  Widget _buildAssignmentList(List<Assignment> assignments) {
    return ListView(
      children: assignments
          .map(
            (assignment) => AssignmentTile(
              assignment: assignment,
              onTap: () => context.pushRoute(
                AssignmentDetailRoute(assignment: assignment),
              ),
              onDismissed: () => _completeAssignment(context, assignment),
            ),
          )
          .toList(),
    );
  }

  void _completeAssignment(BuildContext context, Assignment assignment) {
    ref.read(assignmentsProvider.notifier).markCompleted(assignment.id, true);
    cachedRepository.saveData();

    showSnackBar(SnackBarStyle.info, 'Message.AssignmentCompleted'.tr());
    logEvent(AnalyticsEvent.assignmentsMarkCompleted);
  }

  void _updateState() {
    final data = {
      for (final status in filters)
        status: ref.read(assignmentsProvider.notifier).getAssignments(status),
    };

    data.removeWhere((status, list) => list.isEmpty);
    assignments = data;

    if (!assignments.keys.contains(selectedStatus)) {
      selectedStatus = AssignmentStatus.current;
    }

    setState(() {});
  }
}

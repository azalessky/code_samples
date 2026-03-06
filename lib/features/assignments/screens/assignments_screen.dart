import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/features/assignments/assignments.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class AssignmentsScreen extends ConsumerStatefulWidget {
  const AssignmentsScreen({super.key});

  @override
  ConsumerState<AssignmentsScreen> createState() => _AssignmentsScreenState();
}

class _AssignmentsScreenState extends ConsumerState<AssignmentsScreen>
    with TickerProviderStateMixin {
  late final AppLifecycleListener _appListener;
  final _filters = [AssignmentStatus.current, AssignmentStatus.missed];
  late Map<AssignmentStatus, List<Assignment>> _assignments;
  var _selectedStatus = AssignmentStatus.current;

  @override
  void initState() {
    super.initState();
    _appListener = AppLifecycleListener(onResume: () => _updateState());
    ref.listenManual(assignmentsProvider, (_, _) => _updateState(), fireImmediately: true);
  }

  @override
  void dispose() {
    _appListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(labelsProvider);
    final count = _assignments.values.fold(0, (sum, list) => sum + list.length);

    return DefaultTabController(
      length: _assignments.keys.length,
      child: BackgroundScaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(t.assignmentsScreen.title),
          bottom: count > 0 ? _buildTabBar(context) : null,
        ),
        body: count > 0
            ? _buildTabView(context)
            : SpacePlaceholder(text: t.assignmentsScreen.noData),
      ),
    );
  }

  PreferredSizeWidget _buildTabBar(BuildContext context) {
    return ButtonTabBar(
      tabs: _assignments.keys
          .map(
            (status) => Tab(
              child: Row(
                spacing: FormLayout.textSpacing,
                children: [
                  context.textMedium(status.tr()),
                  context.textMedium(_assignments[status]!.length.toString()),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildTabView(BuildContext context) {
    return TabBarView(
      children: _assignments.keys
          .map((status) => _buildAssignmentList(_assignments[status]!))
          .toList(),
    );
  }

  Widget _buildAssignmentList(List<Assignment> assignments) {
    return ListView.builder(
      itemCount: assignments.length,
      itemBuilder: (context, index) => _buildAssignmentTile(context, assignments[index]),
    );
  }

  Widget _buildAssignmentTile(BuildContext context, Assignment assignment) {
    final labels = ref.read(labelsProvider.notifier).getLabels(assignment.labels);

    return AssignmentTile(
      key: ValueKey(assignment.id),
      assignment: assignment,
      labels: labels,
      onTap: () => context.pushRoute(AssignmentDetailRoute(assignment: assignment)),
      onComplete: () => _completeAssignment(assignment),
      onArchive: () => _archiveAssignment(assignment),
    );
  }

  void _completeAssignment(Assignment assignment) {
    logEvent(AnalyticsEvent.assignmentsCompleteItem);

    final updated = assignment.copyWith(completed: true);
    ref.read(assignmentsProvider.notifier).setItem(updated);
    ref.read(assignmentsProvider.notifier).save();

    messages.showMessage(UserMessage.assignmentCompleted);
    ReviewService.requestReview();
  }

  void _archiveAssignment(Assignment assignment) {
    logEvent(AnalyticsEvent.assignmentsArchiveItem);

    final updated = assignment.copyWith(archived: true);
    ref.read(assignmentsProvider.notifier).setItem(updated);
    ref.read(assignmentsProvider.notifier).save();
  }

  void _updateState() {
    setState(() {
      _assignments = {};

      for (final status in _filters) {
        final data = ref.read(assignmentsProvider.notifier).getAssignments(status);
        if (data.isEmpty) continue;

        final list = status == AssignmentStatus.missed ? data.reversed.toList() : data;
        _assignments[status] = list;
      }

      if (!_assignments.keys.contains(_selectedStatus)) {
        _selectedStatus = AssignmentStatus.current;
      }
    });
  }
}

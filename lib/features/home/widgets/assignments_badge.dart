import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';

class AssignmentsBadge extends ConsumerWidget {
  final Widget child;

  const AssignmentsBadge({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(assignmentsProvider);

    final assignments = ref.read(assignmentsProvider.notifier);
    final current = assignments.getAssignments(AssignmentStatus.current);
    final overdue = assignments.getAssignments(AssignmentStatus.overdue);
    final count = current.length + overdue.length;

    return Badge.count(
      isLabelVisible: count > 0,
      count: count,
      backgroundColor: Theme.of(context).colorScheme.onErrorContainer,
      child: child,
    );
  }
}

import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/models/models.dart';
import 'package:student_planner/common/common.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/repositories/repositories.dart';

part 'assignments.g.dart';

@Riverpod(keepAlive: true)
class Assignments extends _$Assignments with ListState<Assignment>, SaveableList<Assignment> {
  @override
  ListRepository<Assignment> get repository => assignmentsRepository;

  @override
  List<Assignment> build() {
    subscribe(ref);
    return repository.state ?? [];
  }

  @override
  void invalidate() => ref.invalidateSelf();

  Assignment? getAssignment(String refId) {
    return state.firstWhereOrNull((a) => a.refId == refId);
  }

  List<Assignment> getAssignments(AssignmentStatus status) {
    return state.where((p) => p.status == status).toList();
  }

  void updateSubject(String refId, String subject) {
    final assignment = getAssignment(refId);
    if (assignment != null) {
      setItem(assignment.copyWith(subject: subject));
    }
  }

  void updatePeriod(String id, String refId) {
    final assignment = getItem(id);
    if (assignment != null) {
      setItem(assignment.copyWith(refId: refId));
    }
  }
}

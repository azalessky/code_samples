import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/repositories/repositories.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/common/common.dart';

part 'assignments.g.dart';

@Riverpod(keepAlive: true)
class Assignments extends _$Assignments with SerializableList<Assignment> {
  @override
  List<Assignment> build() {
    return cachedRepository.getObjectList<Assignment>(this) ?? [];
  }

  @override
  String get jsonKey => RepositorySettings.assignmentsKey;

  @override
  get deserializer => Assignment.fromJson;

  @override
  get sortItems => _sortItems;

  void updateAssignment(Assignment assignment) {
    final item = getItem(assignment.id);
    if (item == null) {
      addItem(assignment);
    } else {
      updateItem(assignment.id, (item) => assignment);
    }
  }

  void updateSubject(String refId, String subject) {
    final assignment = getAssignment(refId);
    if (assignment != null) {
      updateAssignment(assignment.copyWith(subject: subject));
    }
  }

  Assignment? getAssignment(String refId) {
    return state.firstWhereOrNull((a) => a.refId == refId);
  }

  List<Assignment> getAssignments(AssignmentStatus status) {
    return state.where((p) => p.status == status).toList();
  }

  void markCompleted(String id, bool value) {
    updateItem(
      id,
      (assignment) => assignment.copyWith(completed: value),
    );
  }

  void _sortItems() {
    state.sort((a, b) => a.date.compareTo(b.date));
  }
}

import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/repositories/repositories.dart';

part 'grades.g.dart';

@Riverpod(keepAlive: true)
class Grades extends _$Grades with ListState<Grade>, SaveableList<Grade> {
  @override
  ListRepository<Grade> get repository => gradesRepository;

  @override
  List<Grade> build() {
    subscribe(ref);
    return gradesRepository.state ?? [];
  }

  @override
  void invalidate() => ref.invalidateSelf();

  void updateSubject(String refId, String subject) {
    final grade = getGrade(refId);
    if (grade != null) {
      setItem(grade.copyWith(subject: subject));
    }
  }

  void updateTermGrade(Term term, String subject, List<GradeValue> values, String comment) {
    final grade = getGrade(term.id, subject);
    if (grade == null) {
      addItem(Grade.fromTerm(term, subject, values, comment));
    } else {
      if (values.isEmpty) {
        removeItem(grade.id);
      } else {
        updateItem(grade.id, (_) => grade.copyWith(values: values, comment: comment));
      }
    }
  }

  Grade? getGrade(String refId, [String? subject]) {
    return state.firstWhereOrNull(
      (g) => g.refId == refId && (subject == null || g.subject == subject),
    );
  }

  List<Grade> getGrades(GradeType? type, String? subject, DateRange? dates) {
    return state
        .where(
          (grade) =>
              grade.subject.isNotEmpty &&
              (type == null || grade.type == type) &&
              (subject == null || grade.subject == subject) &&
              (dates == null || grade.date.isBetweenDays(dates.start, dates.end)),
        )
        .toList()
      ..sort();
  }

  void removeGrades(String refId) {
    state = state.where((g) => g.refId != refId).toList();
  }

  List<String> getSubjects(GradeType? type, DateRange? dates) {
    final grades = getGrades(type, null, dates);
    final subjects = grades.map((g) => g.subject).where((s) => s.isNotEmpty);
    return subjects.toSet().toList()..sort();
  }

  List<String> getComments(GradeType? type) {
    final grades = getGrades(type, null, null);
    final comments = grades.reversed.map((g) => g.comment.trim());

    final data = comments.where((c) => c.isNotEmpty);
    return LinkedHashSet<String>.from(data).toList();
  }
}

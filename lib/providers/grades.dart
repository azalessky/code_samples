import 'package:collection/collection.dart';
import 'package:student_planner/common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/repositories/repositories.dart';
import 'package:student_planner/models/models.dart';

part 'grades.g.dart';

@Riverpod(keepAlive: true)
class Grades extends _$Grades with SerializableList<Grade> {
  @override
  List<Grade> build() {
    return cachedRepository.getObjectList<Grade>(this) ?? [];
  }

  @override
  String get jsonKey => RepositorySettings.gradesKey;

  @override
  get deserializer => Grade.fromJson;

  void updateGrade(Grade grade) {
    final item = getItem(grade.id);
    if (item == null) {
      if (grade.isNotEmpty) addItem(grade);
    } else {
      if (grade.isEmpty) {
        removeItem(grade.id);
      } else {
        updateItem(grade.id, (_) => grade);
      }
    }
  }

  void updateSubject(String refId, String subject) {
    final grade = getGrade(refId);
    if (grade != null) {
      updateGrade(grade.copyWith(subject: subject));
    }
  }

  void updatePeriodGrade(Period period, List<GradeValue> values) {
    final grade = getGrade(period.id);
    if (grade == null) {
      updateGrade(Grade.fromPeriod(period, values));
    } else {
      updateGrade(grade.copyWith(values: values));
    }
  }

  void updateTermGrade(Term term, String subject, List<GradeValue> values) {
    final grade = getGrade(term.id, subject);
    if (grade == null) {
      updateGrade(Grade.fromTerm(term, subject, values));
    } else {
      updateGrade(grade.copyWith(values: values));
    }
  }

  Grade? getGrade(String refId, [String? subject]) {
    return state.firstWhereOrNull(
      (g) => g.refId == refId && (subject == null || g.subject == subject),
    );
  }

  List<Grade> getGrades(GradeType type, [String? subject]) {
    final data = state
        .where(
          (g) =>
              g.type == type && ((subject == null && g.subject.isNotEmpty) || g.subject == subject),
        )
        .toList();
    data.sort((a, b) => a.date.compareTo(b.date));
    return data;
  }

  void removeGrades(String refId) {
    state.removeWhere((g) => g.refId == refId);
  }

  List<String> getSubjects(GradeType type) {
    final grades = state.where((g) => g.type == type);
    final subjects = grades.map((g) => g.subject).where((s) => s.isNotEmpty);
    return subjects.toSet().toList()..sort();
  }

  String subjectAverage(String subject, int digits) {
    final data = state.where(
      (g) => g.type == GradeType.period && g.subject == subject,
    );
    final grades = data.expand((g) => g.values).toList();
    return _averageGrade(grades, digits);
  }

  String termsAverage(List<String> termIds, String subject, int digits) {
    final data = state.where(
      (g) => g.type == GradeType.term && g.subject == subject && termIds.contains(g.refId),
    );
    final grades = data.expand((g) => g.values).toList();
    return _averageGrade(grades, digits);
  }

  String _averageGrade(List<GradeValue> grades, int digits) {
    if (grades.isEmpty) return '?';

    double values =
        grades.fold(0, (sum, g) => sum + _convertGrade(g.value) * (g.weight == 0 ? 1 : g.weight));
    double weights = grades.fold(0, (sum, g) => sum + (g.weight == 0 ? 1 : g.weight));

    final average = values / weights;
    return average.toStringAsFixed(digits);
  }

  double _convertGrade(String value) {
    const gpaTable = {'A': 4.0, 'B': 3.0, 'C': 2.0, 'D': 1.0, 'F': 0.0};
    const signValue = 0.33;

    final match = RegExp(r'^([\w\.]+)([+\-]?)$').firstMatch(value);
    if (match == null) return 0;

    final base = match.group(1);
    final sign = match.group(2);

    final parsed = gpaTable[base] ?? double.tryParse(base!);
    if (parsed == null) return 0;

    final adjusted = parsed + (sign == '+' ? signValue : 0) + (sign == '-' ? -signValue : 0);
    return adjusted;
  }
}

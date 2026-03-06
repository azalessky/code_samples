import 'package:flutter/foundation.dart';
import 'package:student_planner/models/models.dart';

class MigrationController {
  /// Возвращает:
  /// - пустой список, если изменений нет
  /// - полный обновлённый список Grade, если миграция была
  List<Grade> migrateAttendanceMarks(GradesConfig config, List<Grade> grades) {
    final attendanceMarks = config.attendanceMarks;
    if (attendanceMarks.isEmpty || grades.isEmpty) return const [];

    final helper = GradesHelper(config);

    // code → fullName
    final attendanceMap = {
      for (final full in attendanceMarks) helper.attendanceCode(full): full,
    };

    bool changed = false;
    final result = <Grade>[];

    for (final grade in grades) {
      // Ищем первое значение, которое является посещаемостью
      final firstAttendance = grade.values.firstWhere(
        (v) => attendanceMap.containsKey(v.value),
        orElse: () => GradeValue(value: '', weight: 0),
      );

      // Если посещаемости нет — просто добавляем оригинальный объект
      if (firstAttendance.value.isEmpty) {
        result.add(grade);
        continue;
      }

      // Удаляем посещаемость из values
      final newValues = grade.values.where((v) => v.value != firstAttendance.value).toList();

      Grade newGrade;

      if (newValues.isEmpty) {
        // Кейс 1 — только посещаемость
        final fullName = attendanceMap[firstAttendance.value]!;

        newGrade = grade.copyWith(
          values: const [],
          attendance: fullName,
        );

        debugPrint(
          '[Migration] Grade ${grade.id}: attendance-only → '
          'set attendance="$fullName", values cleared',
        );
      } else {
        // Кейс 2 — посещаемость + оценки
        newGrade = grade.copyWith(values: newValues);

        debugPrint(
          '[Migration] Grade ${grade.id}: mixed case → '
          'removed attendance value "${firstAttendance.value}", '
          'kept other values',
        );
      }

      result.add(newGrade);
      changed = true;
    }

    return changed ? result : const [];
  }
}

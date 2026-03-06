import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:student_planner/models/models.dart';

class GradesHelper {
  final GradesConfig config;

  const GradesHelper(this.config);

  String formatColorRanges() {
    String formatRange(ColorRange range) =>
        range.from == range.to ? range.from.toString() : '${range.from}-${range.to}';
    return config.gradeColors
        .where((range) => range.from != 0 && range.to != 0)
        .map((range) => formatRange(range))
        .join(', ');
  }

  List<ColorRange> defaultColorRanges() {
    final ranges = defaultScaleRanges();

    return List.generate(
      config.gradeColors.length,
      (index) {
        final color = config.gradeColors[index].color;
        final (from, to) = index < ranges.length ? ranges[index] : (0, 0);
        return (from: from, to: to, color: color);
      },
    );
  }

  List<(int, int)> defaultScaleRanges() {
    final maxGrade = switch (config.gradeScale) {
      GradeScale.numeric5 => 5,
      GradeScale.numeric10 => 10,
      GradeScale.numeric12 => 12,
      GradeScale.numeric20 => 20,
      GradeScale.numeric100 => 100,
    };

    final partSize = (maxGrade / 3).round();
    return [
      (maxGrade - partSize + 1, maxGrade),
      (partSize + 1, maxGrade - partSize),
      (1, partSize),
      (0, 0),
    ];
  }

  String gradeText(Grade grade) {
    if (grade.attendance.isNotEmpty) return attendanceCode(grade.attendance);
    return grade.values.where((g) => g.isNotEmpty).map((g) => g.value).join('/');
  }

  Color gradeColor(Grade grade) {
    final defaultColor = config.gradeColors.last.color;
    final value = _averageGrade(grade.values);
    final rounded = _roundDouble(value, config.roundingThreshold, 0);

    for (final range in config.gradeColors) {
      if (rounded >= range.from && rounded <= range.to) {
        return range.color;
      }
    }
    return defaultColor;
  }

  String attendanceCode(String name) {
    return name.substring(0, 1).toUpperCase();
  }

  Grade subjectAverage(List<Grade> grades) {
    final values = grades.expand((g) => g.values).toList();
    final average = _averageGrade(values);
    final fixed = average.toStringAsFixed(config.roundingPrecision);
    final value = GradeValue(value: fixed, weight: 1);

    return Grade.empty().copyWith(values: [value]);
  }

  double _averageGrade(List<GradeValue> grades) {
    if (grades.isEmpty) return 0;

    double values = 0, weights = 0;
    for (final g in grades) {
      final value = _parseGrade(g.value);
      if (value < 0) continue;

      final weight = g.weight == 0 ? 1 : g.weight;
      values += value * weight;
      weights += weight;
    }
    if (values == 0 || weights == 0) return 0;

    final average = values / weights;
    return _roundDouble(average, config.roundingThreshold, config.roundingPrecision);
  }

  double _parseGrade(String value) {
    final match = RegExp(r'^([\d\.]+)([+\-]?)$').firstMatch(value);
    final base = match?.group(1);
    final sign = match?.group(2);

    final raw = double.tryParse(base ?? '');
    if (raw == null) return -1;

    final plus = sign == '+' ? config.plusValue : 0;
    final minus = sign == '-' ? config.minusValue : 0;
    return raw + plus + minus;
  }

  double _roundDouble(double value, double threshold, int precision) {
    final multiplier = math.pow(10, precision).toDouble();
    final scaled = value * multiplier;
    final fractional = scaled - scaled.floor();

    final rounded = (fractional + 1e-12 >= threshold) ? scaled.ceil() : scaled.floor();
    return rounded / multiplier;
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_planner/helpers/helpers.dart';

part 'study_week.freezed.dart';
part 'study_week.g.dart';

@freezed
class StudyWeek with _$StudyWeek {
  const StudyWeek._();

  const factory StudyWeek({
    required List<bool> days,
  }) = _StudyWeek;

  factory StudyWeek.fromJson(Map<String, dynamic> json) => _$StudyWeekFromJson(json);

  List<int> get studyDays => days.asMap().keys.where((e) => days[e]).map((e) => e + 1).toList();

  String displayText() {
    final names = studyDays.map((e) => DateHelper.getAbbrNameOfWeekDay(e)).toList();
    return names.foldSeparated(',');
  }
}

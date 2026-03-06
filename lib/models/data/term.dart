import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_planner/common/utils/utils.dart';
import 'package:student_planner/models/models.dart';

part 'term.freezed.dart';
part 'term.g.dart';

enum TermType { year, study, vacation, holiday }

@freezed
abstract class Term with _$Term implements BaseObject, Comparable<Term> {
  const Term._();

  const factory Term({
    required String id,
    required String refId,
    required TermType type,
    required String name,
    required DateTime start,
    required DateTime end,
  }) = _Term;

  factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);

  factory Term.empty() => Term(
    id: ObjectId().value,
    refId: '',
    type: TermType.year,
    name: '',
    start: DateHelper.minDate,
    end: DateHelper.maxDate,
  );

  @override
  int compareTo(Term other) => start.compareTo(other.start);

  DateRange get dates => (start: start, end: end);

  bool get isYear => type == TermType.year;
  bool get isStudy => type == TermType.study;
  bool get isBreak => type == TermType.vacation || type == TermType.holiday;

  List<TermType> get typeValues => type == TermType.year
      ? [TermType.year]
      : [
          TermType.study,
          TermType.vacation,
          TermType.holiday,
        ];
}

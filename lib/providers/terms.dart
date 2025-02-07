import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/repositories/repositories.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/common/common.dart';

part 'terms.g.dart';

@Riverpod(keepAlive: true)
class Terms extends _$Terms with SerializableList<Term> {
  static const maxStudyTerms = 4;

  @override
  List<Term> build() {
    return cachedRepository.getObjectList<Term>(this) ?? [];
  }

  @override
  String get jsonKey => RepositorySettings.termsKey;

  @override
  get deserializer => Term.fromJson;

  @override
  get sortItems => _sortItems;

  Term? getTerm(DateTime date, TermType type) {
    return state.firstWhereOrNull(
      (t) => t.type == type && date.inRange(t.start, t.end),
    );
  }

  List<Term> getTerms(TermType type) {
    return state.where((e) => e.type == type).toList();
  }

  DateRange getYear() {
    final terms = getTerms(TermType.study);
    if (terms.isNotEmpty) {
      return (start: terms.first.start, end: terms.last.end);
    } else {
      return (start: DateHelper.minDate, end: DateHelper.maxDate);
    }
  }

  bool isHoliday(DateTime date) {
    return state.indexWhere((t) => t.type == TermType.holiday && date.inRange(t.start, t.end)) >= 0;
  }

  bool isStudy(DateTime date) {
    return !isHoliday(date) &&
        (state.indexWhere((t) => t.type == TermType.study) < 0 ||
            state.indexWhere((t) => t.type == TermType.study && date.inRange(t.start, t.end)) >= 0);
  }

  bool canAddTerm(Term term) {
    if (term.type != TermType.study) return true;

    final item = getItem(term.id);
    final count = getTerms(TermType.study).length;
    final add = item == null ? 1 : (item.type == TermType.study ? 0 : 1);

    return (count + add) <= maxStudyTerms;
  }

  void _sortItems() {
    state.sort((a, b) => a.type != b.type
        ? a.type == TermType.study
            ? -1
            : 1
        : a.start.compareTo(b.start));
  }
}

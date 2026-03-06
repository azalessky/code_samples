import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/repositories/repositories.dart';

part 'terms.g.dart';

@Riverpod(keepAlive: true)
class Terms extends _$Terms with ListState<Term>, SaveableList<Term> {
  @override
  ListRepository<Term> get repository => termsRepository;

  @override
  List<Term> build() {
    subscribe(ref);
    return repository.state ?? [];
  }

  @override
  void invalidate() => ref.invalidateSelf();

  @override
  void sortItems(List<Term> items) {
    items.sortGrouped<String>(
      groupBy: (t) => t.isYear ? t.id : t.refId,
      compareGroups: (a, b) => getItem(b)!.start.compareTo(getItem(a)!.start),
      compareItems: (a, b) => a.type.index != b.type.index
          ? a.type.index.compareTo(b.type.index)
          : a.start.compareTo(b.start),
    );
  }

  void removeTerm(Term term, void Function(Term)? onRemove) {
    if (term.isYear) {
      for (final t in getChildren(term)) {
        removeTerm(t, onRemove);
      }
    }
    removeItem(term.id);
    onRemove?.call(term);
  }

  List<Term> getChildren(Term term) {
    return state.where((t) => t.refId == term.id).toList();
  }

  List<Term> getYears() {
    return state.where((t) => t.isYear).toList();
  }

  List<Term> getStudies([Term? year]) {
    final terms = year == null ? state : getChildren(year);
    return terms.where((t) => t.isStudy).toList();
  }

  List<Term> getBreaks([Term? year]) {
    final terms = year == null ? state : getChildren(year);
    return terms.where((t) => t.isBreak).toList();
  }

  Term? getBreak(DateTime date) {
    return state.firstWhereOrNull((t) => t.isBreak && date.isBetweenDays(t.start, t.end));
  }

  Term? getCurrentTerm(TermType type) {
    final date = DateHelper.todayUtc;
    final terms = state.where(
      (t) => t.type == type && (date.isBetweenDays(t.start, t.end) || date.isAfter(t.end)),
    );
    return maxBy(terms, (t) => t.end);
  }

  bool isStudy(DateTime date) {
    return getBreak(date) != null &&
        (state.indexWhere((t) => t.isStudy) < 0 ||
            state.indexWhere((t) => t.isStudy && date.isBetweenDays(t.start, t.end)) >= 0);
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/features/profile/profile.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class TermsScreen extends EntityListScreen<Term> {
  const TermsScreen({super.key});

  @override
  ConsumerState<EntityListScreen<Term>> createState() => _TermsScreenState();
}

class _TermsScreenState extends EntityListState<Term, TermsScreen> {
  List<Term>? _prevTerms;

  @override
  String get title => t.termsScreen.title;

  @override
  String get deleteText => t.prompt.deleteTerm;

  @override
  String get emptyText => t.termsScreen.noData;

  @override
  ProviderBase<List<Term>> get provider => termsProvider;

  @override
  String Function(Term item) get itemTitle =>
      (item) => item.name;

  @override
  Term Function() get emptyItem =>
      () => Term.empty();

  @override
  PageRouteInfo Function(Term item) get detailRoute =>
      (value) => TermDetailRoute(value: value);

  @override
  AnalyticsEvent get deleteEvent => AnalyticsEvent.termsDeleteItem;

  @override
  void deleteItem(Term term) {
    final grades = ref.read(gradesProvider.notifier);
    ref.read(termsProvider.notifier).removeTerm(term, (t) => grades.removeGrades(t.id));
  }

  @override
  void saveData() {
    ref.read(gradesProvider.notifier).save();
    ref.read(termsProvider.notifier).save();
  }

  @override
  Widget buildBody(BuildContext context) {
    final terms = ref.watch(termsProvider);
    final years = terms.where((t) => t.isYear).toList();
    final focus = _detectAddedTerm(terms);

    return years.isNotEmpty
        ? TermsListView(
            terms: terms,
            deletePrompt: deleteText,
            focusedTerm: focus,
            onTap: (term) => context.pushRoute(detailRoute(term)),
            onDelete: (term) => deleteItem(term),
          )
        : SpacePlaceholder(text: emptyText);
  }

  Term? _detectAddedTerm(List<Term> terms) {
    final prev = _prevTerms?.map((e) => e.id).toSet() ?? {};
    final next = terms.map((e) => e.id).toSet();
    final diff = next.difference(prev);

    _prevTerms = [...terms];
    if (diff.length != 1) return null;

    return terms.firstWhere((t) => t.id == diff.first);
  }
}

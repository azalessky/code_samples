import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/features/shared/shared.dart';

@RoutePage()
class TermsScreen extends ConsumerWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final terms = ref.watch(termsProvider);
    logEvent(AnalyticsEvent.termsShowList);

    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TermsScreen.Title'.tr()),
      ),
      body: terms.isNotEmpty
          ? _buildTermList(context, ref, terms)
          : SpacePlaceholder(text: 'TermsScreen.NoData'.tr()),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.pushRoute(TermDetailRoute()),
      ),
    );
  }

  Widget _buildTermList(BuildContext context, WidgetRef ref, List<Term> terms) {
    return ListView(
      children: terms
          .map(
            (term) => DismissibleTile(
              key: ValueKey(term),
              action: DismissibleAction.actionDelete,
              promptTitle: term.name,
              promptText: 'Prompt.DeleteTerm'.tr(),
              onDismissed: (_) => _deleteTerm(ref, term.id),
              child: _buildTermTile(context, term),
            ),
          )
          .toList(),
    );
  }

  Widget _buildTermTile(BuildContext context, Term term) {
    return ListTile(
      leading: Icon(term.type == TermType.study ? Symbols.school : Symbols.beach_access),
      title: Text(term.name),
      subtitle: Text(DateHelper.formatDateRange(term.start, term.end)),
      onTap: () => context.pushRoute(TermDetailRoute(term: term)),
    );
  }

  void _deleteTerm(WidgetRef ref, String termId) {
    logEvent(AnalyticsEvent.termsDeleteItem);

    ref.read(termsProvider.notifier).removeItem(termId);
    ref.read(gradesProvider.notifier).removeGrades(termId);
    cachedRepository.saveData();
  }
}

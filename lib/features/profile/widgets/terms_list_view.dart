import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/features/profile/profile.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/shared/shared.dart';

class TermsListView extends StatefulWidget {
  static const childrenIndent = 32.0;

  final List<Term> terms;
  final Term? focusedTerm;
  final String deletePrompt;
  final void Function(Term) onTap;
  final void Function(Term) onDelete;

  const TermsListView({
    required this.terms,
    this.focusedTerm,
    required this.deletePrompt,
    required this.onTap,
    required this.onDelete,
    super.key,
  });

  @override
  State<TermsListView> createState() => _TermsListViewState();
}

class _TermsListViewState extends State<TermsListView> {
  final Map<Term, GlobalKey> _itemKeys = {};
  final Map<String, bool> _expansionState = {};

  @override
  void didUpdateWidget(covariant TermsListView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.focusedTerm != oldWidget.focusedTerm && widget.focusedTerm != null) {
      final year = widget.terms.firstWhereOrNull(
        (t) => t.id == widget.focusedTerm!.refId,
      );
      if (year != null) _expansionState[year.id] = true;

      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _scrollToValue(widget.focusedTerm!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final years = widget.terms.where((t) => t.isYear);

    for (final term in widget.terms) {
      _itemKeys[term] = GlobalKey();
    }

    return ListView(
      children: years.map((year) {
        final children = widget.terms.where((t) => t.refId == year.id).toList();
        final tile = _buildExpansionTile(context, year, children);
        return _buildDismissibleTile(year, tile);
      }).toList(),
    );
  }

  Widget _buildDismissibleTile(Term term, Widget child) {
    return Container(
      key: _itemKeys[term],
      child: DismissibleTile(
        uniqueKey: ValueKey(term),
        action: DismissibleAction.negative,
        icon: Symbols.delete,
        promptTitle: term.name,
        promptText: widget.deletePrompt,
        onAction: () => widget.onDelete(term),
        child: child,
      ),
    );
  }

  Widget _buildExpansionTile(BuildContext context, Term term, List<Term> children) {
    return ExpandingTile(
      initiallyExpanded: _expansionState[term.id] ?? false,
      leading: TermIcon(type: term.type),
      title: Text(term.name),
      visualDensity: VisualDensity.compact,
      children: children.map((term) {
        final tile = _buildListTile(context, term);
        return _buildDismissibleTile(term, tile);
      }).toList(),
      onTap: () => widget.onTap(term),
      onExpansionChanged: (expanded) => _expansionState[term.id] = expanded,
    );
  }

  Widget _buildListTile(BuildContext context, Term term) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      contentPadding: .only(left: TermsListView.childrenIndent),
      leading: TermIcon(type: term.type),
      title: Text(term.name),
      onTap: () => widget.onTap(term),
    );
  }

  void _scrollToValue(Term value) {
    final context = _itemKeys[value]?.currentContext;
    if (context != null && context.mounted) {
      Scrollable.ensureVisible(context);
    }
  }
}

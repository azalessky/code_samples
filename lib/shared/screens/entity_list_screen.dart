import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

abstract class EntityListScreen<T> extends ConsumerStatefulWidget {
  const EntityListScreen({super.key});
}

abstract class EntityListState<T, W extends EntityListScreen<T>> extends ConsumerState<W> {
  String get title;
  String get emptyText;
  String get deleteText;
  String? get resetText => null;

  ProviderBase<List<T>> get provider;

  String Function(T item) get itemTitle;
  T Function() get emptyItem;
  PageRouteInfo Function(T item) get detailRoute;

  AnalyticsEvent get deleteEvent;
  AnalyticsEvent? get resetEvent => null;

  void deleteItem(T item);
  void resetItems() {}
  void saveData();

  Widget? buildBody(BuildContext context) => null;
  Widget? buildTile(T item) => null;

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(provider);

    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        actions: [
          if (resetText != null)
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => showPromptDialog(
                title: t.prompt.titleConfirmation,
                text: resetText!,
                onConfirmed: () => _resetItems(),
              ),
            ),
        ],
      ),
      body:
          buildBody(context) ??
          (items.isNotEmpty ? buildList(items) : SpacePlaceholder(text: emptyText)),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showItemDetail(emptyItem()),
      ),
    );
  }

  Widget buildList(List<T> items) {
    return ListView(
      children: items
          .map(
            (item) => DismissibleTile(
              uniqueKey: ValueKey(item),
              action: DismissibleAction.negative,
              icon: Symbols.delete,
              promptTitle: itemTitle(item),
              promptText: deleteText,
              onAction: () => _deleteItem(item),
              child: GestureDetector(
                child: buildTile(item),
                onTap: () => _showItemDetail(item),
              ),
            ),
          )
          .toList(),
    );
  }

  void _showItemDetail(T item) {
    context.pushRoute(detailRoute(item));
  }

  void _deleteItem(T item) {
    deleteItem(item);
    saveData();
  }

  void _resetItems() {
    logEvent(resetEvent!);
    resetItems();
    saveData();
  }
}

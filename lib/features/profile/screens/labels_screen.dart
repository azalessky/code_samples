import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class LabelsScreen extends EntityListScreen<Label> {
  const LabelsScreen({super.key});

  @override
  ConsumerState<EntityListScreen<Label>> createState() => _LabelsScreenState();
}

class _LabelsScreenState extends EntityListState<Label, LabelsScreen> {
  @override
  String get title => t.labelsScreen.title;

  @override
  String get emptyText => t.labelsScreen.noData;

  @override
  String get deleteText => t.prompt.deleteLabel;

  @override
  String? get resetText => t.prompt.resetLabels;

  @override
  ProviderBase<List<Label>> get provider => labelsProvider;

  @override
  String Function(Label item) get itemTitle =>
      (item) => item.name;

  @override
  Label Function() get emptyItem =>
      () => Label.empty();

  @override
  PageRouteInfo Function(Label item) get detailRoute =>
      (value) => LabelDetailRoute(value: value);

  @override
  AnalyticsEvent get deleteEvent => AnalyticsEvent.labelsDeleteItem;

  @override
  AnalyticsEvent? get resetEvent => AnalyticsEvent.labelsResetItems;

  @override
  void deleteItem(Label item) => ref.read(labelsProvider.notifier).removeItem(item.id);

  @override
  void resetItems() => ref.read(labelsProvider.notifier).resetLabels();

  @override
  void saveData() => ref.read(labelsProvider.notifier).save();

  @override
  Widget buildTile(Label label) {
    return ListTile(
      leading: LabelIcon(color: label.color),
      title: Text(label.name),
    );
  }
}

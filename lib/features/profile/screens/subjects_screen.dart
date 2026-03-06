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
class SubjectsScreen extends EntityListScreen<Subject> {
  const SubjectsScreen({super.key});

  @override
  ConsumerState<EntityListScreen<Subject>> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends EntityListState<Subject, SubjectsScreen> {
  @override
  String get title => t.subjectsScreen.title;

  @override
  String get emptyText => t.subjectsScreen.noData;

  @override
  String get deleteText => t.prompt.deleteSubject;

  @override
  String get resetText => t.prompt.resetSubjects;

  @override
  ProviderBase<List<Subject>> get provider => subjectsProvider;

  @override
  String Function(Subject item) get itemTitle =>
      (item) => item.name;

  @override
  Subject Function() get emptyItem =>
      () => Subject.empty();

  @override
  PageRouteInfo Function(Subject item) get detailRoute =>
      (value) => SubjectDetailRoute(value: value);

  @override
  AnalyticsEvent get deleteEvent => AnalyticsEvent.subjectsDeleteItem;

  @override
  AnalyticsEvent get resetEvent => AnalyticsEvent.subjectsResetItems;

  @override
  void deleteItem(Subject item) => ref.read(subjectsProvider.notifier).removeItem(item.id);

  @override
  void resetItems() => ref.read(subjectsProvider.notifier).resetSubjects();

  @override
  void saveData() => ref.read(subjectsProvider.notifier).save();

  @override
  Widget buildTile(Subject subject) {
    return ListTile(title: Text(subject.name));
  }
}

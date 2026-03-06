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
class TeachersScreen extends EntityListScreen<Teacher> {
  const TeachersScreen({super.key});

  @override
  ConsumerState<EntityListScreen<Teacher>> createState() => _TeachersScreenState();
}

class _TeachersScreenState extends EntityListState<Teacher, TeachersScreen> {
  @override
  String get title => t.teachersScreen.title;

  @override
  String get emptyText => t.teachersScreen.noData;

  @override
  String get deleteText => t.prompt.deleteTeacher;

  @override
  ProviderBase<List<Teacher>> get provider => teachersProvider;

  @override
  String Function(Teacher item) get itemTitle =>
      (t) => t.name;

  @override
  Teacher Function() get emptyItem =>
      () => Teacher.empty();

  @override
  PageRouteInfo Function(Teacher item) get detailRoute =>
      (value) => TeacherDetailRoute(value: value);

  @override
  AnalyticsEvent get deleteEvent => AnalyticsEvent.teachersDeleteItem;

  @override
  void deleteItem(Teacher teacher) => ref.read(teachersProvider.notifier).removeItem(teacher.id);

  @override
  void saveData() => ref.read(teachersProvider.notifier).save();

  @override
  Widget buildTile(Teacher teacher) {
    return ListTile(
      leading: AvatarField(
        initialValue: teacher.photo,
        name: teacher.name,
        radius: 24,
      ),
      title: Text(teacher.name),
      subtitle: Column(
        crossAxisAlignment: .start,
        spacing: FormLayout.lineSpacing,
        children: [
          Text(teacher.subjects.join(', ')),
          if (teacher.note.isNotEmpty) Text(teacher.note),
        ],
      ),
    );
  }
}

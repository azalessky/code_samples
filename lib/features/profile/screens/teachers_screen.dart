import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/features/shared/shared.dart';
import 'package:student_planner/features/profile/profile.dart';

@RoutePage()
class TeachersScreen extends ConsumerWidget {
  const TeachersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teachers = ref.watch(teachersProvider);
    logEvent(AnalyticsEvent.teachersShowList);

    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TeachersScreen.Title'.tr()),
      ),
      body: teachers.isNotEmpty
          ? _buildTeacherList(context, ref, teachers)
          : SpacePlaceholder(text: 'TeachersScreen.NoData'.tr()),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.pushRoute(TeacherDetailRoute()),
      ),
    );
  }

  Widget _buildTeacherList(BuildContext context, WidgetRef ref, List<Teacher> teachers) {
    return ListView(
      children: teachers
          .map(
            (teacher) => DismissibleTile(
              key: ValueKey(teacher),
              action: DismissibleAction.actionDelete,
              promptTitle: teacher.name,
              promptText: 'Prompt.DeleteTeacher'.tr(),
              onDismissed: (_) => _deleteTeacher(ref, teacher.id),
              child: _buildTeacherTile(context, teacher),
            ),
          )
          .toList(),
    );
  }

  Widget _buildTeacherTile(BuildContext context, Teacher teacher) {
    return ListTile(
      key: ValueKey(teacher),
      leading: AvatarField(
        avatar: teacher.avatar,
        name: teacher.name,
      ),
      title: Text(teacher.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: FormLayout.lineSpacing,
        children: [
          Text(teacher.subjects.foldSeparated(',')),
          if (teacher.note.isNotEmpty) Text(teacher.note),
        ],
      ),
      onTap: () => context.pushRoute(TeacherDetailRoute(teacher: teacher)),
    );
  }

  void _deleteTeacher(WidgetRef ref, String teacherId) {
    logEvent(AnalyticsEvent.teachersDeleteItem);

    ref.read(teachersProvider.notifier).removeItem(teacherId);
    cachedRepository.saveData();
  }
}

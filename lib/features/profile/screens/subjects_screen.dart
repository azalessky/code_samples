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

@RoutePage()
class SubjectsScreen extends ConsumerWidget {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjects = ref.watch(subjectsProvider);
    logEvent(AnalyticsEvent.subjectsShowList);

    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SubjectsScreen.Title').tr(),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => showPromptDialog(
              context: context,
              title: 'Prompt.Confirmation'.tr(),
              text: 'Prompt.ResetSubjects'.tr(),
              onConfirmed: () => _resetSubjects(ref),
            ),
          ),
        ],
      ),
      body: subjects.isNotEmpty
          ? _buildSubjectList(context, ref, subjects)
          : SpacePlaceholder(text: 'SubjectsScreen.NoData'.tr()),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.pushRoute(SubjectDetailRoute()),
      ),
    );
  }

  Widget _buildSubjectList(BuildContext context, WidgetRef ref, List<Subject> subjects) {
    return ListView(
      children: subjects
          .map(
            (subject) => DismissibleTile(
              key: ValueKey(subject),
              action: DismissibleAction.actionDelete,
              promptTitle: subject.name,
              promptText: 'Prompt.DeleteSubject'.tr(),
              onDismissed: (_) => _deleteSubject(ref, subject.id),
              child: _buildSubjectTile(context, subject),
            ),
          )
          .toList(),
    );
  }

  Widget _buildSubjectTile(BuildContext context, Subject subject) {
    return ListTile(
      key: ValueKey(subject),
      title: Text(subject.name),
      trailing: context.textMedium(subject.room),
      onTap: () => context.pushRoute(SubjectDetailRoute(subject: subject)),
    );
  }

  void _deleteSubject(WidgetRef ref, String subjectId) {
    logEvent(AnalyticsEvent.subjectsDeleteItem);

    ref.read(subjectsProvider.notifier).removeItem(subjectId);
    cachedRepository.saveData();
  }

  void _resetSubjects(WidgetRef ref) {
    logEvent(AnalyticsEvent.subjectsResetItems);

    ref.read(subjectsProvider.notifier).resetSubjects();
    cachedRepository.saveData();
  }
}

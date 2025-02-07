import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/features/shared/shared.dart';
import 'package:student_planner/features/profile/profile.dart';

@RoutePage()
class TeacherDetailScreen extends ConsumerStatefulWidget {
  final Teacher? teacher;

  const TeacherDetailScreen({
    this.teacher,
    super.key,
  });

  @override
  ConsumerState<TeacherDetailScreen> createState() => _TeacherDetailScreenState();
}

class _TeacherDetailScreenState extends ConsumerState<TeacherDetailScreen> {
  final formKey = GlobalKey<FormState>();
  late Teacher teacher;

  @override
  void initState() {
    super.initState();
    teacher = widget.teacher ?? Teacher.empty();
  }

  @override
  Widget build(BuildContext context) {
    final subjects = ref.read(subjectsProvider.notifier).names;

    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TeacherDetailScreen.Title'.tr()),
        actions: [
          if (widget.teacher != null)
            IconButton(
              icon: const Icon(Icons.delete_outlined),
              onPressed: () => showPromptDialog(
                context: context,
                title: teacher.name,
                text: 'Prompt.DeleteTeacher'.tr(),
                onConfirmed: _deleteTeacher,
              ),
            ),
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: FormLayout.formPadding,
          child: Column(
            children: [
              AvatarField(
                avatar: teacher.avatar,
                name: teacher.name,
                radius: 32,
                onSaved: (value) => teacher = teacher.copyWith(avatar: value),
              ),
              FormLayout.sectionSpacer,
              TextFormField(
                autofocus: true,
                initialValue: teacher.name,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(FieldConstraints.teacherNameLength)
                ],
                decoration: InputDecoration(hintText: 'TeacherDetailScreen.NameHint'.tr()),
                textCapitalization: TextCapitalization.sentences,
                validator: TextRequiredValidator().validate,
                onSaved: (value) => teacher = teacher.copyWith(name: value!),
              ),
              FormLayout.fieldSpacer,
              TextChipField(
                values: subjects,
                initialValue: teacher.subjects,
                hintText: 'TeacherDetailScreen.SubjectHint'.tr(),
                onSaved: (value) => teacher = teacher.copyWith(subjects: value),
              ),
              FormLayout.fieldSpacer,
              TextFormField(
                initialValue: teacher.note,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(FieldConstraints.teacherNoteLength)
                ],
                decoration: InputDecoration(hintText: 'TeacherDetailScreen.NoteHint'.tr()),
                textCapitalization: TextCapitalization.sentences,
                onSaved: (value) => teacher = teacher.copyWith(note: value!),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitForm,
        child: const Icon(Icons.save),
      ),
    );
  }

  void _deleteTeacher() {
    logEvent(AnalyticsEvent.teachersDeleteItem);

    FocusManager.instance.primaryFocus?.unfocus();
    context.maybePop();

    ref.read(teachersProvider.notifier).removeItem(teacher.id);
    cachedRepository.saveData();
  }

  void _submitForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      context.maybePop();

      logEvent(AnalyticsEvent.teachersUpdateItem);
      ref.read(teachersProvider.notifier).setItem(teacher);
      cachedRepository.saveData();
    }
  }
}

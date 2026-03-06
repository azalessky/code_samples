import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/features/profile/profile.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class TeacherDetailScreen extends EntityDetailScreen<Teacher> {
  const TeacherDetailScreen({
    required super.value,
    super.key,
  });

  @override
  ConsumerState<TeacherDetailScreen> createState() => _TeacherDetailState();
}

class _TeacherDetailState extends EntityDetailState<Teacher, TeacherDetailScreen> {
  @override
  String get title => t.teacherDetailScreen.title;

  @override
  String get deleteText => t.prompt.deleteTeacher;

  @override
  String get deleteTitle => value.name;

  @override
  AnalyticsEvent get updateEvent => AnalyticsEvent.teachersUpdateItem;

  @override
  AnalyticsEvent get deleteEvent => AnalyticsEvent.teachersDeleteItem;

  @override
  bool isEmpty(Teacher item) => item.name.isEmpty;

  @override
  void updateItem(Teacher item) => ref.read(teachersProvider.notifier).setItem(item);

  @override
  void deleteItem(Teacher item) => ref.read(teachersProvider.notifier).removeItem(item.id);

  @override
  void saveData() => ref.read(teachersProvider.notifier).save();

  @override
  Widget buildForm(BuildContext context) {
    final subjects = ref.read(subjectsProvider.notifier).names;

    return Column(
      children: [
        AvatarField(
          key: ObjectKey(value),
          initialValue: value.photo,
          name: value.name,
          radius: 32,
          onSaved: (photo) => value = value.copyWith(photo: photo),
        ),
        FormLayout.sectionSpacer,
        TextFormField(
          autofocus: isEmpty(value),
          initialValue: value.name,
          inputFormatters: [LengthLimitingTextInputFormatter(FieldConstraints.teacherNameLength)],
          decoration: InputDecoration(hintText: t.teacherDetailScreen.nameHint),
          textCapitalization: .sentences,
          validator: TextRequiredValidator().validate,
          onSaved: (name) => value = value.copyWith(name: name!),
        ),
        FormLayout.fieldSpacer,
        ObjectListField<String>(
          initialValue: value.subjects,
          hintText: t.teacherDetailScreen.subjectHint,
          textBuilder: (subject) => subject,
          addItem: (current) => _addSubject(subjects, current),
          onSaved: (subjects) => value = value.copyWith(subjects: subjects),
        ),
        FormLayout.fieldSpacer,
        TextFormField(
          initialValue: value.note,
          inputFormatters: [LengthLimitingTextInputFormatter(FieldConstraints.teacherNoteLength)],
          decoration: InputDecoration(hintText: t.teacherDetailScreen.noteHint),
          maxLines: null,
          keyboardType: .multiline,
          textInputAction: .newline,
          textCapitalization: .sentences,
          onSaved: (note) => value = value.copyWith(note: note!),
        ),
      ],
    );
  }

  Future<String?> _addSubject(List<String> subjects, List<String> value) async {
    return showModalDialog<String>(
      builder: (_) => ValueListDialog(
        values: subjects.excludeList(value),
        textBuilder: (value) => value,
      ),
    );
  }
}

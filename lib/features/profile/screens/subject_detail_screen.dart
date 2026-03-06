import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class SubjectDetailScreen extends EntityDetailScreen<Subject> {
  const SubjectDetailScreen({
    required super.value,
    super.key,
  });

  @override
  ConsumerState<SubjectDetailScreen> createState() => _SubjectDetailState();
}

class _SubjectDetailState extends EntityDetailState<Subject, SubjectDetailScreen> {
  @override
  String get title => t.subjectDetailScreen.title;

  @override
  String get deleteText => t.prompt.deleteSubject;

  @override
  String get deleteTitle => value.name;

  @override
  AnalyticsEvent get updateEvent => AnalyticsEvent.subjectsUpdateItem;

  @override
  AnalyticsEvent get deleteEvent => AnalyticsEvent.subjectsDeleteItem;

  @override
  bool isEmpty(Subject item) => item.name.isEmpty;

  @override
  void updateItem(Subject item) => ref.read(subjectsProvider.notifier).setItem(item);

  @override
  void deleteItem(Subject item) => ref.read(subjectsProvider.notifier).removeItem(item.id);

  @override
  void saveData() => ref.read(subjectsProvider.notifier).save();

  @override
  Widget buildForm(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          autofocus: isEmpty(value),
          initialValue: value.name,
          inputFormatters: [LengthLimitingTextInputFormatter(FieldConstraints.subjectNameLength)],
          decoration: InputDecoration(hintText: t.subjectDetailScreen.nameHint),
          textCapitalization: .sentences,
          validator: TextRequiredValidator().validate,
          onSaved: (name) => value = value.copyWith(name: name!),
        ),
      ],
    );
  }
}

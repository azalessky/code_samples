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
class LabelDetailScreen extends EntityDetailScreen<Label> {
  const LabelDetailScreen({
    required super.value,
    super.key,
  });

  @override
  ConsumerState<LabelDetailScreen> createState() => _LabelDetailState();
}

class _LabelDetailState extends EntityDetailState<Label, LabelDetailScreen> {
  @override
  String get title => t.labelDetailScreen.title;

  @override
  String get deleteText => t.prompt.deleteLabel;

  @override
  String get deleteTitle => value.name;

  @override
  AnalyticsEvent get updateEvent => AnalyticsEvent.labelsUpdateItem;

  @override
  AnalyticsEvent get deleteEvent => AnalyticsEvent.labelsDeleteItem;

  @override
  bool isEmpty(Label item) => item.name.isEmpty;

  @override
  void updateItem(Label item) => ref.read(labelsProvider.notifier).setItem(item);

  @override
  void deleteItem(Label item) => ref.read(labelsProvider.notifier).removeItem(item.id);

  @override
  void saveData() => ref.read(labelsProvider.notifier).save();

  @override
  Widget buildForm(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          autofocus: isEmpty(value),
          initialValue: value.name,
          inputFormatters: [LengthLimitingTextInputFormatter(FieldConstraints.labelTextLength)],
          textCapitalization: .sentences,
          decoration: InputDecoration(hintText: t.labelDetailScreen.nameHint),
          validator: TextRequiredValidator().validate,
          onSaved: (name) => value = value.copyWith(name: name!),
        ),
        FormLayout.fieldSpacer,
        ColorField(
          initialValue: value.color,
          hintText: t.labelDetailScreen.colorHint,
          dialogTitle: t.labelDetailScreen.dialogTitle,
          onSaved: (color) => value = value.copyWith(color: color),
        ),
      ],
    );
  }
}

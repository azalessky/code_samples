import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/controllers/controllers.dart';
import 'package:student_planner/features/schedule/schedule.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class LessonDetailScreen extends ConsumerStatefulWidget {
  final Period period;
  final Assignment assignment;

  const LessonDetailScreen({
    super.key,
    required this.period,
    required this.assignment,
  });

  @override
  ConsumerState<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends ConsumerState<LessonDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  late Period _period;
  late Assignment _assignment;
  late LessonController _controller;

  @override
  void initState() {
    super.initState();

    _period = widget.period;
    _assignment = widget.assignment;
    _controller = LessonController(ref);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(settingsProvider.select((c) => c.schedule));
    ref.watch(subjectsProvider);
    ref.watch(labelsProvider);

    return BackgroundScaffold(
      appBar: CustomAppBar(
        title: t.lessonDetailScreen.title(slot: _period.slot + 1),
        subtitle: _period.date.format(DateFormat.MONTH_WEEKDAY_DAY),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => _showActionMenu(),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: FormLayout.formPadding,
          child: _buildInputFields(),
        ),
        onPopInvokedWithResult: (_, result) {
          if (result == null) _submitForm();
        },
      ),
    );
  }

  Widget _buildInputFields() {
    final subjects = ref.read(subjectsProvider);
    final labels = ref.read(labelsProvider);

    return Column(
      children: [
        DropDownField<Subject>(
          initialValue: subjects.firstWhereOrNull((s) => s.name == _period.subject),
          values: subjects,
          clearButton: true,
          textBuilder: (value) => value.name,
          hintText: t.lessonDetailScreen.subjectHint,
          onSaved: (value) => _period = _period.copyWith(subject: value?.name ?? ''),
        ),
        FormLayout.fieldSpacer,
        TextFormField(
          initialValue: _period.topic,
          inputFormatters: [LengthLimitingTextInputFormatter(FieldConstraints.periodTopicLength)],
          decoration: InputDecoration(hintText: t.lessonDetailScreen.topicHint),
          maxLines: null,
          keyboardType: .multiline,
          textInputAction: .newline,
          textCapitalization: .sentences,
          onSaved: (value) => _period = _period.copyWith(topic: value!),
        ),
        FormLayout.fieldSpacer,
        PrefixedTextField(
          initialValue: _period.room,
          prefixText: t.lessonDetailScreen.roomPrefix,
          hintText: t.lessonDetailScreen.roomHint,
          inputFormatters: [LengthLimitingTextInputFormatter(FieldConstraints.periodRoomLength)],
          onSaved: (value) => _period = _period.copyWith(room: value!),
        ),
        FormLayout.fieldSpacer,
        AssignmentField(
          initialValue: _assignment,
          labels: labels,
          hintText: t.assignmentField.hintText,
          addText: t.assignmentField.addText,
          actionTitle: t.assignmentField.actionTitle,
          labelTitle: t.assignmentField.labelTitle,
          imageTitle: t.assignmentField.imageTitle,
          imageError: t.assignmentField.imageError,
          onSaved: (value) => _assignment = value,
          onComplete: (value) => setState(
            () => AssignmentController(ref).completeAssignment(context, value),
          ),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_period == widget.period && _assignment == widget.assignment) return;

      final assignment = _assignment != widget.assignment ? _assignment : null;
      _controller.updateLesson(_period, assignment);
    }
  }

  void _showActionMenu() {
    showModalDialog<UserAction>(
      builder: (_) => ActionDialog(
        values: [UserAction.share, UserAction.delete],
        iconBuilder: (value) => ActionIcon(action: value),
        textBuilder: (value) => value.tr(),
      ),
      onSaved: (value) => switch (value) {
        UserAction.share => _shareLesson(),
        UserAction.delete => _controller.deleteLesson(context, _period, _assignment),
        _ => null,
      },
    );
  }

  void _shareLesson() {
    _formKey.currentState!.save();
    _controller.shareLesson(context, _period, _assignment);
  }
}

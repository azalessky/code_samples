import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/controllers/controllers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class AssignmentDetailScreen extends ConsumerStatefulWidget {
  final Assignment assignment;

  const AssignmentDetailScreen({
    super.key,
    required this.assignment,
  });

  @override
  ConsumerState<AssignmentDetailScreen> createState() => _AssignmentDetailScreenState();
}

class _AssignmentDetailScreenState extends ConsumerState<AssignmentDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  late Assignment _assignment;
  late AssignmentController _controller;

  @override
  void initState() {
    super.initState();
    _assignment = widget.assignment;
    _controller = AssignmentController(ref);
  }

  @override
  Widget build(BuildContext context) {
    final labels = ref.read(labelsProvider);

    return BackgroundScaffold(
      appBar: CustomAppBar(
        title: _assignment.subject.ifEmpty(t.assignmentDetailScreen.title),
        subtitle: _assignment.date.format(DateFormat.MONTH_WEEKDAY_DAY),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: _showActionMenu,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: FormLayout.formPadding,
          child: AssignmentField(
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
              () => _controller.completeAssignment(context, value),
            ),
          ),
        ),
        onPopInvokedWithResult: (_, result) {
          if (result == null) _submitForm();
        },
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_assignment != widget.assignment) _controller.updateAssignment(_assignment);
    }
  }

  void _showActionMenu() {
    final futurePeriods = ref.read(periodsProvider.notifier).getFuture(_assignment.refId, 4);

    showModalDialog<UserAction>(
      builder: (_) => ActionDialog(
        values: [
          if (futurePeriods.isNotEmpty) UserAction.move,
          UserAction.share,
          UserAction.delete,
        ],
        iconBuilder: (value) => ActionIcon(action: value),
        textBuilder: (value) => value.tr(),
      ),
      onSaved: (value) => switch (value) {
        UserAction.move => _controller.moveAssignment(
          context,
          _assignment,
          futurePeriods,
          t.assignmentDetailScreen.moveTitle,
        ),
        UserAction.share => _shareAssignment(),
        UserAction.delete => _controller.deleteAssignment(context, _assignment),
        _ => null,
      },
    );
  }

  void _shareAssignment() {
    _formKey.currentState!.save();
    _controller.shareAssignment(context, _assignment);
  }
}

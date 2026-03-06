import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

class AssignmentField extends StatefulWidget {
  final Assignment initialValue;
  final List<Label> labels;
  final String hintText;
  final String addText;
  final String actionTitle;
  final String labelTitle;
  final String imageTitle;
  final String imageError;
  final int maxLines;
  final ValueChanged<Assignment>? onSaved;
  final ValueChanged<bool>? onComplete;

  const AssignmentField({
    super.key,
    required this.initialValue,
    required this.labels,
    required this.hintText,
    required this.addText,
    required this.actionTitle,
    required this.labelTitle,
    required this.imageTitle,
    required this.imageError,
    this.maxLines = 8,
    this.onSaved,
    this.onComplete,
  });

  @override
  State<AssignmentField> createState() => _AssignmentFieldState();
}

class _AssignmentFieldState extends State<AssignmentField> {
  final _pickerLock = AsyncLock();
  late Assignment _assignment;

  @override
  void initState() {
    super.initState();
    _assignment = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<Assignment>(
      initialValue: _assignment,
      builder: (state) => AssignmentInput(
        initialValue: _assignment.content,
        hintText: widget.hintText,
        addText: widget.addText,
        top: _buildImageGallery(),
        bottom: _buildActionBar(),
        onChanged: (value) => _assignment = _assignment.copyWith(content: value),
      ),
      onSaved: (_) => widget.onSaved?.call(_assignment),
    );
  }

  Widget _buildActionBar() {
    final labels = widget.labels.where((label) => _assignment.labels.contains(label.name)).toList();

    return AssignmentToolbar(
      actions: [
        UserAction.addPhoto,
        UserAction.addImage,
        UserAction.addLabel,
        _assignment.content.when(
          text: (_) => UserAction.addList,
          list: (_) => UserAction.addText,
        ),
      ],
      labels: labels,
      dialogTitle: widget.actionTitle,
      isCompleted: _assignment.isEmpty ? null : _assignment.completed,
      onAction: (action, label) => switch (action) {
        UserAction.addPhoto => _pickImage(ImageSource.camera),
        UserAction.addImage => _pickImage(ImageSource.gallery),
        UserAction.addLabel => _addLabel(label),
        UserAction.addText => _addText(),
        UserAction.addList => _addList(),
        _ => null,
      },
      onComplete: () {
        _assignment = _assignment.copyWith(completed: !_assignment.completed);
        widget.onComplete?.call(_assignment.completed);
      },
    );
  }

  Widget _buildImageGallery() {
    return ImageGallery(
      title: _assignment.subject.ifEmpty(widget.imageTitle),
      subtitle: _assignment.date.format(DateFormat.MONTH_WEEKDAY_DAY),
      errorText: widget.imageError,
      images: _assignment.images,
      rowSize: 3,
      onDelete: (value) => _deleteImage(value),
    );
  }

  void _pickImage(ImageSource source) async {
    _pickerLock.run(() async {
      logEvent(AnalyticsEvent.assignmentsAddImage);

      final imagePath = await ImageStorage.pickImage(source);
      if (imagePath != null) {
        setState(
          () => _assignment = _assignment.copyWith(
            images: [..._assignment.images, imagePath],
          ),
        );
      }
    });
  }

  void _deleteImage(String path) {
    logEvent(AnalyticsEvent.assignmentsDeleteImage);

    showPromptDialog(
      title: t.prompt.titleConfirmation,
      text: t.prompt.deleteImage,
      onConfirmed: () {
        context.maybePop();
        setState(
          () => _assignment = _assignment.copyWith(
            images: _assignment.images.exclude(path),
          ),
        );
      },
    );
  }

  void _addLabel(String? selected) async {
    logEvent(AnalyticsEvent.assignmentsAddLabel);

    if (widget.labels.isEmpty) {
      await context.pushRoute(LabelsRoute());
      return;
    }

    showModalDialog<String>(
      builder: (_) => ValueListDialog(
        title: widget.labelTitle,
        values: widget.labels.map((label) => label.name).toList(),
        initialValue: selected,
        textBuilder: (value) => value,
        iconBuilder: (value) {
          final label = widget.labels.firstWhereOrNull((label) => label.name == value);
          return LabelIcon(color: label?.color);
        },
        clearTitle: selected?.isNotEmpty == true ? t.button.delete : null,
        onSelected: (value) {
          var labels = _assignment.labels;
          if (selected != null) labels = labels.exclude(selected);
          if (value != null) labels = labels.addUnique(value);
          setState(() => _assignment = _assignment.copyWith(labels: labels));
        },
      ),
    );
  }

  void _addText() {
    logEvent(AnalyticsEvent.assignmentsAddText);
    setState(
      () => _assignment = _assignment.copyWith(
        content: _assignment.content.convert(),
      ),
    );
  }

  void _addList() {
    logEvent(AnalyticsEvent.assignmentsAddList);
    setState(
      () => _assignment = _assignment.copyWith(
        content: _assignment.content.convert(),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:image_picker/image_picker.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/features/shared/shared.dart';
import 'package:student_planner/features/assignments/assignments.dart';

@RoutePage()
class AssignmentDetailScreen extends ConsumerStatefulWidget {
  final Assignment? assignment;
  final Period? period;

  const AssignmentDetailScreen({
    this.assignment,
    this.period,
    super.key,
  });

  @override
  ConsumerState<AssignmentDetailScreen> createState() => _AssignmentDetailScreenState();
}

class _AssignmentDetailScreenState extends ConsumerState<AssignmentDetailScreen> {
  final formKey = GlobalKey<FormState>();
  final textNode = FocusNode();
  late Assignment assignment;
  late String textValue;
  late bool editMode;

  @override
  void initState() {
    super.initState();
    logEvent(AnalyticsEvent.assignmentsShowItem);

    if (widget.assignment != null) {
      assignment = widget.assignment!;
    } else if (widget.period != null) {
      assignment = Assignment.fromPeriod(widget.period!);
    } else {
      assignment = Assignment.empty();
    }

    textValue = assignment.text;
    editMode = textValue.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          assignment.subject.ifEmpty('AssignmentDetailScreen.Title'.tr()),
        ),
        actions: [
          IconButton(
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.share),
            onPressed: () => _shareButtonHandler(context),
          ),
          IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: () => _selectImageHandler(context),
            icon: const Icon(Icons.photo_camera_outlined),
          ),
          FormLayout.mediumSpacer,
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: FormLayout.formPadding,
          child: Column(
            children: [
              Center(
                child: context.titleMedium(
                  DateHelper.formatDayMonth(assignment.date),
                ),
              ),
              FormLayout.fieldSpacer,
              TextFormField(
                focusNode: textNode,
                autofocus: editMode,
                maxLines: 5,
                initialValue: assignment.text,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(FieldConstraints.assignmentTexLength)
                ],
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: 'AssignmentDetailScreen.TextHint'.tr(),
                ),
                onChanged: (value) => textValue = value,
                onSaved: (value) => assignment = assignment.copyWith(text: value!),
                onTap: () => setState(() => editMode = true),
              ),
              Row(
                children: [
                  Spacer(),
                  context.titleMedium('AssignmentDetailScreen.CompletedToggle'.tr()),
                  Checkbox(
                    value: assignment.completed,
                    onChanged: (value) => _completeAssignment(context, value!),
                  ),
                ],
              ),
              FormLayout.largeSpacer,
              ImageGallery(
                editMode: editMode,
                title: assignment.subject.ifEmpty('AssignmentDetailScreen.ImageTitle'.tr()),
                images: assignment.images,
                deletePrompt: 'Prompt.DeleteImage'.tr(),
                onDelete: (value) => _deleteImage(value),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        child: Icon(editMode ? Icons.save : Icons.edit),
        onPressed: () => _actionButtonHandler(context),
      ),
    );
  }

  void _shareButtonHandler(BuildContext context) {
    if (assignment.images.isNotEmpty) {
      showModalDialog<int>(
        context: context,
        builder: (_) => ActionDialog(
          values: [0, 1],
          iconBuilder: (value) => switch (value) {
            0 => const Icon(Icons.description_outlined),
            1 => const Icon(Icons.image_outlined),
            _ => Container(),
          },
          textBuilder: (index) => switch (index) {
            0 => 'AssignmentDetailScreen.ShareText'.tr(),
            1 => 'AssignmentDetailScreen.ShareImages'.tr(),
            _ => '',
          },
        ),
        onSaved: (value) => value == 0 ? _shareAssignmentText() : _shareAssignmentImages(),
      );
    } else {
      _shareAssignmentText();
    }
  }

  void _shareAssignmentText() {
    logEvent(AnalyticsEvent.assignmentsShareText);
    Share.share('${assignment.subject.ifEmpty('AssignmentDetailScreen.Title'.tr())}\n'
        '${DateHelper.formatDayMonth(assignment.date)}\n'
        '$textValue');
  }

  void _shareAssignmentImages() {
    logEvent(AnalyticsEvent.assignmentsShareImages);
    Share.shareXFiles(
      assignment.images.map((image) => XFile(image)).toList(),
      text: '${assignment.subject.ifEmpty('AssignmentDetailScreen.Title'.tr())}\n'
          '${DateHelper.formatDayMonth(assignment.date)}',
    );
  }

  void _actionButtonHandler(BuildContext context) {
    if (editMode) {
      if (formKey.currentState!.validate()) {
        logEvent(AnalyticsEvent.assignmentsUpdateItem);

        formKey.currentState!.save();
        context.maybePop();

        ref.read(assignmentsProvider.notifier).updateAssignment(assignment);
        if (widget.period != null) {
          ref.read(periodsProvider.notifier).updatePeriod(widget.period!);
        }
        cachedRepository.saveData();
      }
    } else {
      setState(() {
        editMode = true;
        textNode.requestFocus();
      });
    }
  }

  void _selectImageHandler(BuildContext context) {
    showModalDialog<ImageSource>(
      context: context,
      builder: (_) => ActionDialog(
        values: const [ImageSource.camera, ImageSource.gallery],
        iconBuilder: (value) => switch (value) {
          ImageSource.camera => const Icon(Icons.photo_camera_outlined),
          ImageSource.gallery => const Icon(Icons.image_outlined),
        },
        textBuilder: (value) => switch (value) {
          ImageSource.camera => 'AssignmentDetailScreen.TakePhoto'.tr(),
          ImageSource.gallery => 'AssignmentDetailScreen.ChooseImage'.tr(),
        },
      ),
      onSaved: (value) => _pickImage(value),
    );
  }

  void _pickImage(ImageSource source) async {
    logEvent(AnalyticsEvent.assignmentsPickImage);

    final imageFile = await ImagePicker().pickImage(source: source);
    if (imageFile != null) {
      setState(() {
        assignment = assignment.copyWith(
          images: [...assignment.images, imageFile.path],
        );
        editMode = true;
      });
    }
  }

  void _deleteImage(String path) async {
    logEvent(AnalyticsEvent.assignmentsDeleteImage);

    setState(() {
      assignment = assignment.copyWith(
        images: assignment.images.exclude(path),
      );
    });
  }

  void _completeAssignment(BuildContext context, bool value) {
    logEvent(AnalyticsEvent.assignmentsMarkCompleted);

    assignment = assignment.copyWith(completed: value);
    ref.read(assignmentsProvider.notifier).updateAssignment(assignment);
    cachedRepository.saveData();

    if (assignment.completed) {
      showSnackBar(SnackBarStyle.info, 'Message.AssignmentCompleted'.tr());
    }
    context.maybePop();
  }
}

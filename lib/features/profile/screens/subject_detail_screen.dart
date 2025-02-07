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

@RoutePage()
class SubjectDetailScreen extends ConsumerStatefulWidget {
  final Subject? subject;

  const SubjectDetailScreen({
    this.subject,
    super.key,
  });

  @override
  ConsumerState<SubjectDetailScreen> createState() => _SubjectDetailScreenState();
}

class _SubjectDetailScreenState extends ConsumerState<SubjectDetailScreen> {
  final formKey = GlobalKey<FormState>();
  late Subject subject;

  @override
  void initState() {
    super.initState();
    subject = widget.subject ?? Subject.empty();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SubjectDetailScreen.Title'.tr()),
        actions: [
          if (widget.subject != null)
            IconButton(
              icon: const Icon(Icons.delete_outlined),
              onPressed: () => showPromptDialog(
                context: context,
                title: subject.name,
                text: 'Prompt.DeleteSubject'.tr(),
                onConfirmed: _deleteSubject,
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
              TextFormField(
                autofocus: true,
                initialValue: subject.name,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(FieldConstraints.subjectNameLength)
                ],
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(hintText: 'SubjectDetailScreen.NameHint'.tr()),
                validator: TextRequiredValidator().validate,
                onSaved: (value) => subject = subject.copyWith(name: value!),
              ),
              FormLayout.fieldSpacer,
              TextFormField(
                initialValue: subject.room,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(FieldConstraints.subjectRoomLength)
                ],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'SubjectDetailScreen.RoomHint'.tr()),
                onSaved: (value) => subject = subject.copyWith(room: value!),
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

  void _deleteSubject() {
    logEvent(AnalyticsEvent.subjectsDeleteItem);

    FocusManager.instance.primaryFocus?.unfocus();
    context.maybePop();

    ref.read(subjectsProvider.notifier).removeItem(subject.id);
    cachedRepository.saveData();
  }

  void _submitForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      context.maybePop();

      logEvent(AnalyticsEvent.subjectsUpdateItem);
      ref.read(subjectsProvider.notifier).setItem(subject);

      cachedRepository.saveData();
    }
  }
}

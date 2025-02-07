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
class NoteDetailScreen extends ConsumerStatefulWidget {
  final Note? note;
  final DateTime? date;

  const NoteDetailScreen({
    this.note,
    this.date,
    super.key,
  });

  @override
  ConsumerState<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends ConsumerState<NoteDetailScreen> {
  final formKey = GlobalKey<FormState>();
  final textNode = FocusNode();
  late Note note;
  late bool editMode;

  @override
  void initState() {
    super.initState();
    note = widget.note ?? Note.empty().copyWith(date: widget.date!);
    editMode = note.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('NoteDetailScreen.Title'.tr()),
        actions: [
          if (widget.note != null)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => showPromptDialog(
                context: context,
                title: 'Prompt.Confirmation'.tr(),
                text: 'Prompt.DeleteNote'.tr(),
                onConfirmed: _deleteNote,
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
              Center(
                child: context.titleMedium(
                  DateHelper.formatDayMonth(note.date),
                ),
              ),
              FormLayout.fieldSpacer,
              TextFormField(
                focusNode: textNode,
                autofocus: editMode,
                maxLines: 5,
                initialValue: note.text,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(FieldConstraints.noteTextLength)
                ],
                decoration: InputDecoration(hintText: 'NoteDetailScreen.TextHint'.tr()),
                textCapitalization: TextCapitalization.sentences,
                validator: TextRequiredValidator().validate,
                onSaved: (value) => note = note.copyWith(text: value!),
                onTap: () => setState(() => editMode = true),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: _submitForm,
        child: Icon(editMode ? Icons.save : Icons.edit),
      ),
    );
  }

  void _deleteNote() {
    logEvent(AnalyticsEvent.notesDeleteItem);

    FocusManager.instance.primaryFocus?.unfocus();
    context.maybePop();

    ref.read(notesProvider.notifier).removeItem(note.id);
    cachedRepository.saveData();
  }

  void _submitForm() {
    if (editMode) {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        context.maybePop();

        logEvent(AnalyticsEvent.notesUpdateItem);
        ref.read(notesProvider.notifier).setItem(note);
        cachedRepository.saveData();
      }
    } else {
      setState(() {
        editMode = true;
        textNode.requestFocus();
      });
    }
  }
}

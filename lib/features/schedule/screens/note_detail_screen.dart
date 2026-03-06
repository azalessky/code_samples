import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

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
  final _formKey = GlobalKey<FormState>();
  late Note _note;

  @override
  void initState() {
    super.initState();
    _note = widget.note ?? Note.empty().copyWith(date: widget.date!);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: CustomAppBar(
        title: t.noteDetailScreen.title,
        subtitle: _note.date.format(DateFormat.MONTH_WEEKDAY_DAY),
        actions: [if (widget.note != null) _buildDeleteButton()],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: FormLayout.formPadding,
          child: _buildInputField(),
        ),
        onPopInvokedWithResult: (_, result) {
          if (result == null) _submitForm();
        },
      ),
    );
  }

  Widget _buildDeleteButton() {
    return IconButton(
      icon: const Icon(Icons.delete_outline),
      onPressed: () => showPromptDialog(
        title: t.prompt.titleConfirmation,
        text: t.prompt.deleteNote,
        onConfirmed: _deleteNote,
      ),
    );
  }

  Widget _buildInputField() {
    return TextFormField(
      autofocus: _note.text.isEmpty,
      minLines: 5,
      maxLines: null,
      initialValue: _note.text,
      keyboardType: .multiline,
      textInputAction: .newline,
      textCapitalization: .sentences,
      decoration: InputDecoration(hintText: t.noteDetailScreen.textHint),
      inputFormatters: [LengthLimitingTextInputFormatter(FieldConstraints.noteTextLength)],
      onSaved: (value) => _note = _note.copyWith(text: value!),
    );
  }

  void _deleteNote() {
    logEvent(AnalyticsEvent.notesDeleteItem);

    FocusManager.instance.primaryFocus?.unfocus();
    context.maybePop(_note);

    ref.read(notesProvider.notifier).removeItem(_note.id);
    ref.read(notesProvider.notifier).save();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      logEvent(AnalyticsEvent.notesUpdateItem);

      _formKey.currentState!.save();
      if (_note == widget.note) return;

      ref.read(notesProvider.notifier).setItem(_note);
      ref.read(notesProvider.notifier).save();
    }
  }
}

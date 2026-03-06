import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

abstract class EntityDetailScreen<T> extends ConsumerStatefulWidget {
  final T value;

  const EntityDetailScreen({
    required this.value,
    super.key,
  });
}

abstract class EntityDetailState<T, W extends EntityDetailScreen<T>> extends ConsumerState<W> {
  late T value;
  final formKey = GlobalKey<FormState>();

  String get title;
  String get deleteText;
  String get deleteTitle;

  AnalyticsEvent get updateEvent;
  AnalyticsEvent get deleteEvent;

  bool isEmpty(T item);
  void updateItem(T item);
  void deleteItem(T item);
  void saveData();

  Widget buildForm(BuildContext context);

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        actions: [
          if (!isEmpty(widget.value))
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: _confirmDelete,
            ),
        ],
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: SingleChildScrollView(
          padding: FormLayout.formPadding,
          child: buildForm(context),
        ),
        onPopInvokedWithResult: (_, result) {
          if (result == null) _submitForm();
        },
      ),
    );
  }

  void _submitForm() async {
    if (formKey.currentState!.validate()) {
      logEvent(updateEvent);

      formKey.currentState!.save();
      if (value == widget.value) return;

      updateItem(value);
      saveData();
    }
  }

  void _confirmDelete() {
    showPromptDialog(
      title: deleteTitle,
      text: deleteText,
      onConfirmed: () {
        logEvent(deleteEvent);

        deleteItem(value);
        saveData();
        context.maybePop(value);
      },
    );
  }
}

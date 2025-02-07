import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/features/shared/shared.dart';

@RoutePage()
class TermDetailScreen extends ConsumerStatefulWidget {
  final Term? term;

  const TermDetailScreen({
    this.term,
    super.key,
  });

  @override
  ConsumerState<TermDetailScreen> createState() => _TermDetailScreenState();
}

class _TermDetailScreenState extends ConsumerState<TermDetailScreen> {
  final formKey = GlobalKey<FormState>();
  late Term term;
  TermType? type;

  @override
  void initState() {
    super.initState();
    term = widget.term ?? Term.empty();
    type = widget.term?.type;
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TermDetailScreen.Title'.tr()),
        actions: [
          if (widget.term != null)
            IconButton(
              icon: const Icon(Icons.delete_outlined),
              onPressed: () => showPromptDialog(
                context: context,
                title: term.name,
                text: 'Prompt.DeleteTerm'.tr(),
                onConfirmed: _deleteTerm,
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
              DropDownField<TermType>(
                values: TermType.values,
                initialValue: type,
                hintText: 'TermDetailScreen.TypeHint'.tr(),
                textBuilder: (value) => value.toString().tr(),
                onSaved: (value) => term = term.copyWith(type: type = value),
              ),
              FormLayout.fieldSpacer,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                initialValue: term.name,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(FieldConstraints.termNameLength)
                ],
                decoration: InputDecoration(hintText: 'TermDetailScreen.NameHint'.tr()),
                textCapitalization: TextCapitalization.sentences,
                validator: TextRequiredValidator().validate,
                onSaved: (value) => term = term.copyWith(name: value!),
              ),
              FormLayout.fieldSpacer,
              DateTimeField(
                initialValue: term.start == DateHelper.minDate
                    ? term.end != DateHelper.maxDate
                        ? term.end
                        : null
                    : term.start,
                minValue: DateHelper.minDate,
                maxValue: term.end,
                hintText: 'TermDetailScreen.StartHint'.tr(),
                onChanged: (value) => setState(() => term = term.copyWith(start: value!)),
              ),
              FormLayout.fieldSpacer,
              DateTimeField(
                initialValue: term.end == DateHelper.maxDate
                    ? term.start != DateHelper.minDate
                        ? term.start
                        : null
                    : term.end,
                minValue: term.start,
                maxValue: DateHelper.maxDate,
                hintText: 'TermDetailScreen.EndHint'.tr(),
                onChanged: (value) => setState(() => term = term.copyWith(end: value!)),
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

  void _deleteTerm() {
    logEvent(AnalyticsEvent.termsDeleteItem);

    FocusManager.instance.primaryFocus?.unfocus();
    context.maybePop();

    ref.read(termsProvider.notifier).removeItem(term.id);
    ref.read(gradesProvider.notifier).removeGrades(term.id);
    cachedRepository.saveData();
  }

  void _submitForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      context.maybePop();

      final terms = ref.read(termsProvider.notifier);
      if (terms.canAddTerm(term)) {
        logEvent(AnalyticsEvent.termsUpdateItem);
        terms.setItem(term);
        cachedRepository.saveData();
      } else {
        showSnackBar(SnackBarStyle.error, 'TermsScreen.TermLimit'.tr());
      }
    }
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/features/profile/profile.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class TermDetailScreen extends EntityDetailScreen<Term> {
  const TermDetailScreen({
    super.key,
    required super.value,
  });

  @override
  ConsumerState<TermDetailScreen> createState() => _TermDetailState();
}

class _TermDetailState extends EntityDetailState<Term, TermDetailScreen> {
  late final List<Term> _years;
  late TermType _type;

  @override
  String get title => t.termDetailScreen.title;

  @override
  String get deleteText => t.prompt.deleteTerm;

  @override
  String get deleteTitle => value.name;

  @override
  AnalyticsEvent get updateEvent => AnalyticsEvent.termsUpdateItem;

  @override
  AnalyticsEvent get deleteEvent => AnalyticsEvent.termsDeleteItem;

  @override
  bool isEmpty(Term item) => item.name.isEmpty;

  @override
  void updateItem(Term item) => ref.read(termsProvider.notifier).setItem(item);

  @override
  void deleteItem(Term item) {
    final grades = ref.read(gradesProvider.notifier);
    ref.read(termsProvider.notifier).removeTerm(item, (t) => grades.removeGrades(t.id));
  }

  @override
  void saveData() {
    ref.read(gradesProvider.notifier).save();
    ref.read(termsProvider.notifier).save();
  }

  @override
  void initState() {
    super.initState();
    _years = ref.read(termsProvider.notifier).getYears();
    _type = value.type;
  }

  @override
  Widget buildForm(BuildContext context) {
    final config = ref.watch(settingsProvider.select((c) => c.schedule));

    return Column(
      children: [
        _buildTypeField(config),
        if (!value.isYear) ...[
          FormLayout.fieldSpacer,
          _buildYearField(),
        ],
        FormLayout.fieldSpacer,
        _buildNameField(),
        FormLayout.fieldSpacer,
        _buildStartField(),
        FormLayout.fieldSpacer,
        _buildEndField(),
      ],
    );
  }

  Widget _buildTypeField(ScheduleConfig config) {
    return DropDownField<TermType>(
      initialValue: isEmpty(value) ? null : _type,
      values: _years.isEmpty ? [TermType.year] : TermType.values,
      hintText: t.termDetailScreen.typeHint,
      dialogTitle: t.termDetailScreen.typeTitle,
      textBuilder: (type) => type == TermType.study ? config.academicTerm.tr() : type.tr(),
      iconBuilder: (type) => TermIcon(type: type),
      onChanged: (type) => setState(
        () => value = value.copyWith(
          type: _type = type!,
          refId: type == TermType.year ? '' : value.refId,
        ),
      ),
    );
  }

  Widget _buildYearField() {
    return DropDownField<Term>(
      initialValue: _years.singleWhereOrNull((t) => t.id == value.refId),
      values: _years.excludeWhere((t) => t.id == value.id),
      hintText: t.termDetailScreen.yearHint,
      dialogTitle: t.termDetailScreen.yearTitle,
      textBuilder: (term) => term.name,
      onSaved: (term) => value = value.copyWith(refId: term!.id),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: value.name,
      inputFormatters: [LengthLimitingTextInputFormatter(FieldConstraints.termNameLength)],
      decoration: InputDecoration(hintText: t.termDetailScreen.nameHint),
      textCapitalization: .sentences,
      validator: TextRequiredValidator().validate,
      onSaved: (name) => value = value.copyWith(name: name!),
    );
  }

  Widget _buildStartField() {
    return DateTimeField(
      initialValue: value.start == DateHelper.minDate
          ? value.end != DateHelper.maxDate
                ? value.end
                : null
          : value.start,
      minValue: DateHelper.minDate,
      maxValue: value.end,
      hintText: t.termDetailScreen.startHint,
      onChanged: (start) => setState(() => value = value.copyWith(start: start!)),
    );
  }

  Widget _buildEndField() {
    return DateTimeField(
      initialValue: value.end == DateHelper.maxDate
          ? value.start != DateHelper.minDate
                ? value.start
                : null
          : value.end,
      minValue: value.start,
      maxValue: DateHelper.maxDate,
      hintText: t.termDetailScreen.endHint,
      onChanged: (end) => setState(() => value = value.copyWith(end: end!)),
    );
  }
}

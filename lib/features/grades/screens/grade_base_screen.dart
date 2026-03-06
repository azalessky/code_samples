import 'package:flutter/material.dart';

import 'package:student_planner/models/models.dart';
import 'package:student_planner/shared/shared.dart';

class GradeFilter {
  final Term? initialValue;
  final List<Term> values;
  final String dialogTitle;

  const GradeFilter(this.initialValue, this.values, this.dialogTitle);
}

class GradeBaseScreen extends StatelessWidget {
  final String title;
  final Widget iconButton;
  final Widget body;
  final GradeFilter? yearFilter;
  final GradeFilter? termFilter;
  final ValueChanged<Term?>? onYearChanged;
  final ValueChanged<Term?>? onTermChanged;

  const GradeBaseScreen({
    required this.title,
    required this.iconButton,
    required this.body,
    this.yearFilter,
    this.termFilter,
    this.onYearChanged,
    this.onTermChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(title),
        bottom: _buildFilterBar(),
        actions: [iconButton],
      ),
      body: body,
    );
  }

  PreferredSizeWidget? _buildFilterBar() {
    if (yearFilter == null && termFilter == null) return null;

    return FilterButtonBar(
      buttons: [
        if (yearFilter != null)
          FilterButton<Term>(
            initialValue: yearFilter!.initialValue,
            values: yearFilter!.values,
            dialogTitle: yearFilter!.dialogTitle,
            textBuilder: (value) => value?.name ?? yearFilter!.dialogTitle,
            onChanged: (value) {
              onYearChanged?.call(value);
              onTermChanged?.call(null);
            },
          ),
        if (termFilter != null)
          FilterButton<Term>(
            initialValue: termFilter!.initialValue,
            values: termFilter!.values,
            dialogTitle: termFilter!.dialogTitle,
            clearButton: true,
            textBuilder: (value) => value?.name ?? termFilter!.dialogTitle,
            onChanged: (value) => onTermChanged?.call(value),
          ),
      ],
    );
  }
}

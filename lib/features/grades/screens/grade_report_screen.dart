import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/features/grades/grades.dart';

@RoutePage()
class GradeReportScreen extends ConsumerStatefulWidget {
  static const maxColumnCount = 5;

  const GradeReportScreen({super.key});

  @override
  ConsumerState<GradeReportScreen> createState() => _GradeReportScreenState();
}

class _GradeReportScreenState extends ConsumerState<GradeReportScreen> {
  Term? _selectedYear;

  @override
  void initState() {
    super.initState();
    ref.listenManual(termsProvider, fireImmediately: true, (_, _) => _updateSelectedYear());
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(termsProvider);
    ref.watch(gradesProvider);
    ref.watch(subjectsProvider);

    final years = ref.read(termsProvider.notifier).getYears();

    return GradeBaseScreen(
      title: t.gradeReportScreen.title,
      iconButton: IconButton(
        onPressed: () => GradeTabs.showGradeBook(context),
        icon: Icon(Icons.list_alt_outlined),
      ),
      body: GradeReportView(year: _selectedYear),
      yearFilter: years.isNotEmpty
          ? GradeFilter(_selectedYear, years, t.gradeBookScreen.yearTitle)
          : null,
      onYearChanged: (value) => setState(() => _selectedYear = value),
    );
  }

  void _updateSelectedYear() {
    setState(() {
      final terms = ref.read(termsProvider.notifier);
      _selectedYear = terms.getCurrentTerm(TermType.year);
    });
  }
}

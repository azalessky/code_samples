import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/features/grades/grades.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';

@RoutePage()
class GradeBookScreen extends ConsumerStatefulWidget {
  const GradeBookScreen({super.key});

  @override
  ConsumerState<GradeBookScreen> createState() => _GradeBookScreenState();
}

class _GradeBookScreenState extends ConsumerState<GradeBookScreen> {
  Term? _selectedYear;
  Term? _selectedTerm;

  @override
  void initState() {
    super.initState();
    ref.listenManual(termsProvider, fireImmediately: true, (_, _) => _updateSelectedTerm());
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(gradesProvider);
    ref.watch(termsProvider);

    final config = ref.watch(settingsProvider.select((c) => c.schedule));
    final years = ref.read(termsProvider.notifier).getYears();
    final terms = ref.read(termsProvider.notifier).getStudies(_selectedYear);

    return GradeBaseScreen(
      title: t.gradeBookScreen.title,
      iconButton: IconButton(
        onPressed: () => GradeTabs.showGradeReport(context),
        icon: Icon(Icons.table_chart_outlined),
      ),
      body: GradeBookView(term: _selectedTerm ?? _selectedYear),
      yearFilter: years.isNotEmpty
          ? GradeFilter(_selectedYear, years, t.gradeBookScreen.yearTitle)
          : null,
      termFilter: terms.isNotEmpty
          ? GradeFilter(_selectedTerm, terms, config.academicTerm.tr())
          : null,
      onYearChanged: (value) => setState(() => _selectedYear = value),
      onTermChanged: (value) => setState(() => _selectedTerm = value),
    );
  }

  void _updateSelectedTerm() {
    setState(() {
      final terms = ref.read(termsProvider.notifier);
      _selectedYear = terms.getCurrentTerm(TermType.year);
      _selectedTerm = terms.getCurrentTerm(TermType.study);
    });
  }
}

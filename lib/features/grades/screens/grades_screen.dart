import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:student_planner/common/common.dart';

class GradeTabs {
  static void showGradeBook(BuildContext context) {
    return AutoTabsRouter.of(context).setActiveIndex(0);
  }

  static void showGradeReport(BuildContext context) {
    return AutoTabsRouter.of(context).setActiveIndex(1);
  }
}

@RoutePage()
class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        GradeBookRoute(),
        GradeReportRoute(),
      ],
      builder: (context, child) => child,
    );
  }
}

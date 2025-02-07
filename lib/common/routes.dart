import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:student_planner/models/models.dart';
import 'package:student_planner/features/assignments/assignments.dart';
import 'package:student_planner/features/bells/bells.dart';
import 'package:student_planner/features/grades/grades.dart';
import 'package:student_planner/features/home/home.dart';
import 'package:student_planner/features/profile/profile.dart';
import 'package:student_planner/features/schedule/schedule.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class Routes extends RootStackRouter {
  RouterConfig<UrlState> get configuration {
    return super.config(
      navigatorObservers: () => [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
      ],
    );
  }

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          children: [
            AutoRoute(page: ScheduleRoute.page),
            AutoRoute(page: AssignmentsRoute.page),
            AutoRoute(page: GradesRoute.page),
            AutoRoute(page: BellsRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(page: SubjectsRoute.page),
        AutoRoute(page: TeachersRoute.page),
        AutoRoute(page: TermsRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: HelpRoute.page),
        AutoRoute(page: SubscriptionsRoute.page),
        //
        AutoRoute(page: ImageRoute.page),
        AutoRoute(page: AssignmentDetailRoute.page),
        AutoRoute(page: NoteDetailRoute.page),
        AutoRoute(page: SubjectDetailRoute.page),
        AutoRoute(page: TeacherDetailRoute.page),
        AutoRoute(page: TermDetailRoute.page),
        AutoRoute(page: GradeHistoryRoute.page),
      ];
}

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:date_tab_pager/date_tab_pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/features/assignments/assignments.dart';
import 'package:student_planner/features/bells/bells.dart';
import 'package:student_planner/features/grades/grades.dart';
import 'package:student_planner/features/home/home.dart';
import 'package:student_planner/features/profile/profile.dart';
import 'package:student_planner/features/schedule/schedule.dart';
import 'package:student_planner/features/settings/settings.dart';
import 'package:student_planner/managers/managers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/services/services.dart';

part 'routes.gr.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final routerProvider = Provider<Routes>((ref) => Routes(navigatorKey: navigatorKey));

@AutoRouterConfig()
class Routes extends RootStackRouter {
  Routes({super.navigatorKey});

  RouterConfig<UrlState> get configuration => super.config(
    navigatorObservers: () => [AnalyticsAutoRouteObserver()],
    deepLinkBuilder: (deepLink) => DeepLinkManager().resolve(deepLink),
  );

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      initial: true,
      children: [
        AutoRoute(
          page: ScheduleRoute.page,
          children: [
            AutoRoute(page: DailyScheduleRoute.page),
            AutoRoute(page: WeeklyScheduleRoute.page),
          ],
        ),
        AutoRoute(page: AssignmentsRoute.page),
        AutoRoute(page: BellsRoute.page),
        AutoRoute(
          page: GradesRoute.page,
          children: [
            AutoRoute(page: GradeBookRoute.page, initial: true),
            AutoRoute(page: GradeReportRoute.page),
          ],
        ),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),
    AutoRoute(page: AssignmentDetailRoute.page),
    AutoRoute(page: LessonDetailRoute.page),
    AutoRoute(page: GradeBookRoute.page),
    AutoRoute(page: GradeReportRoute.page),
    AutoRoute(page: GradesHistoryRoute.page),
    AutoRoute(page: HelpRoute.page),
    AutoRoute(page: ImageRoute.page),
    AutoRoute(page: LabelDetailRoute.page),
    AutoRoute(page: LabelsRoute.page),
    AutoRoute(page: NoteDetailRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: GeneralSettingsRoute.page),
    AutoRoute(page: AdvancedSettingsRoute.page),
    AutoRoute(page: RemindersSettingsRoute.page),
    AutoRoute(page: ScheduleSettingsRoute.page),
    AutoRoute(page: GradesSettingsRoute.page),
    AutoRoute(page: SubjectDetailRoute.page),
    AutoRoute(page: SubjectsRoute.page),
    AutoRoute(page: TeacherDetailRoute.page),
    AutoRoute(page: TeachersRoute.page),
    AutoRoute(page: TermDetailRoute.page),
    AutoRoute(page: TermsRoute.page),
  ];
}

class AnalyticsAutoRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    if (!_shouldLogRoute(route)) return;

    final data = _extractRouteData(route);
    if (data != null) logScreen(data.name);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (!_shouldLogRoute(route)) return;

    final data = _extractRouteData(previousRoute);
    if (data != null) logScreen(data.name);
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    logScreen(route.name);
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    logScreen(route.name);
  }

  RouteData? _extractRouteData(Route? route) {
    final settings = route?.settings;
    return settings is AutoRoutePage ? settings.routeData : null;
  }

  bool _shouldLogRoute(Route route) {
    return route is! PopupRoute && route is! DialogRoute && route is! ModalBottomSheetRoute;
  }
}

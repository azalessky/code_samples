import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';

class DeepLinkManager {
  DeepLink resolve(PlatformDeepLink deepLink) {
    final uri = deepLink.uri;
    return _resolveHome(uri) ?? _resolveLesson(uri) ?? deepLink;
  }

  DeepLink? _resolveHome(Uri uri) {
    if (uri.scheme != 'studentplanner' || uri.host != 'home') return null;

    logEvent(AnalyticsEvent.deepLinkOpen, {'host': uri.host});
    return DeepLink.single(ScheduleRoute());
  }

  DeepLink? _resolveLesson(Uri uri) {
    if (uri.scheme != 'studentplanner' || uri.host != 'lesson') return null;

    final periodId = uri.queryParameters['id'];
    if (periodId == null) return null;

    final periods = providerContainer.read(periodsProvider.notifier);
    final assignments = providerContainer.read(assignmentsProvider.notifier);

    final period = periods.getItem(periodId);
    if (period == null) return null;

    var assignment = assignments.getAssignment(periodId);
    assignment ??= Assignment.fromPeriod(period);

    logEvent(AnalyticsEvent.deepLinkOpen, {'host': uri.host});

    return DeepLink.single(
      LessonDetailRoute(
        period: period,
        assignment: assignment,
        key: ValueKey(assignment),
      ),
    );
  }
}

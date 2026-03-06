import 'package:date_tab_pager/date_tab_pager.dart';
import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';

class ScheduleController {
  final PositionController dailyController;
  final PositionController weeklyController;

  bool _isUpdating = false;

  ScheduleController({
    required DateTime position,
    required List<int> weekdays,
    int maxDays = 1000,
    int maxWeeks = 200,
  }) : dailyController = PositionController(
         position: position,
         weekdays: weekdays,
         maxItems: maxDays,
       ),
       weeklyController = PositionController(
         position: position,
         weekdays: weekdays,
         maxItems: maxWeeks,
       ) {
    dailyController.addListener(_handleDailyUpdate);
    weeklyController.addListener(_handleWeeklyUpdate);
  }

  void dispose() {
    dailyController.removeListener(_handleDailyUpdate);
    dailyController.dispose();
    weeklyController.removeListener(_handleWeeklyUpdate);
    weeklyController.dispose();
  }

  void _safeUpdate(VoidCallback callback) {
    if (_isUpdating) return;
    try {
      _isUpdating = true;
      callback();
    } finally {
      _isUpdating = false;
    }
  }

  void _handleDailyUpdate() {
    _safeUpdate(() {
      final date = dailyController.position.weekStart(dailyController.weekdays);
      weeklyController.animateTo(date);
    });
  }

  void _handleWeeklyUpdate() {
    _safeUpdate(() {
      final date = weeklyController.position;
      dailyController.animateTo(date);
    });
  }
}

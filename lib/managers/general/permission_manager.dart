import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

class PermissionManager {
  final WidgetRef ref;
  final _updateLock = AsyncLock();
  late final AppLifecycleListener _appListener;

  PermissionManager(this.ref);

  Future<void> initialize() async {
    await _checkPermissions();
  }

  void subscribe() {
    ref.listenManual(settingsProvider, (_, _) => _checkPermissions());
    _appListener = AppLifecycleListener(onResume: _checkPermissions);
  }

  void dispose() {
    _appListener.dispose();
  }

  Future<void> _checkPermissions() async {
    await _updateLock.run(() async {
      final config = ref.read(settingsProvider);

      if (config.reminders.lessonStart.enabled || config.reminders.upcomingAssignments.enabled) {
        await NotificationService.instance.requestNotificationsPermission();
        await NotificationService.instance.requestAlarmsPermission(_promptPermission);
      }
      if (config.advanced.lessonMode.enabled) {
        await NotificationService.instance.requestAlarmsPermission(_promptPermission);
        if (!await FocusService.instance.hasPermission()) {
          if (await _promptPermission()) await FocusService.instance.requestPermission();
        }
      }
    });
  }

  Future<bool> _promptPermission() async {
    final result = await showPromptDialog(
      title: t.prompt.titleConfirmation,
      text: t.prompt.requirePermission,
    );
    return result ?? false;
  }
}

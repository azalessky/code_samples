import 'package:do_not_disturb/do_not_disturb.dart';

import 'package:student_planner/services/services.dart';

enum FocusMode { unknown, all, priority, none, alarms }

class FocusService {
  static final instance = FocusService._();
  final _plugin = DoNotDisturbPlugin();

  FocusService._();

  Future<FocusMode> getMode() async {
    try {
      return _modeFromFilter(await _plugin.getDNDStatus());
    } catch (e, st) {
      logError(e, st);
      return FocusMode.unknown;
    }
  }

  Future<void> setMode(FocusMode mode) async {
    try {
      await _plugin.setInterruptionFilter(_filterFromMode(mode));
    } catch (e, st) {
      logError(e, st);
    }
  }

  Future<bool> hasPermission() async {
    try {
      return await _plugin.isNotificationPolicyAccessGranted();
    } catch (e, st) {
      logError(e, st);
      return false;
    }
  }

  Future<void> requestPermission() async {
    try {
      await _plugin.openNotificationPolicyAccessSettings();
    } catch (e, st) {
      logError(e, st);
    }
  }

  InterruptionFilter _filterFromMode(FocusMode mode) => switch (mode) {
    FocusMode.unknown => InterruptionFilter.unknown,
    FocusMode.all => InterruptionFilter.all,
    FocusMode.priority => InterruptionFilter.priority,
    FocusMode.none => InterruptionFilter.none,
    FocusMode.alarms => InterruptionFilter.alarms,
  };

  FocusMode _modeFromFilter(InterruptionFilter filter) => switch (filter) {
    InterruptionFilter.unknown => FocusMode.unknown,
    InterruptionFilter.all => FocusMode.all,
    InterruptionFilter.priority => FocusMode.priority,
    InterruptionFilter.none => FocusMode.none,
    InterruptionFilter.alarms => FocusMode.alarms,
  };
}

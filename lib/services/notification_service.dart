import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import 'package:student_planner/services/services.dart';

class NotificationService {
  static const String _defaultIcon = '@mipmap/ic_launcher';
  static const Importance _importance = .high;
  static const Priority _priority = .high;

  static final instance = NotificationService._();

  FlutterLocalNotificationsPlugin? _plugin;
  AndroidFlutterLocalNotificationsPlugin? _androidPlugin;
  final Map<String, String> _channels = {};

  NotificationService._();

  static Future<void> initialize() async {
    if (instance._androidPlugin != null) return;
    await instance._initPlugin();
  }

  static Future<void> createChannel(String channelId, String channelName) async {
    try {
      instance._channels[channelId] = channelName;

      await instance._androidPlugin?.createNotificationChannel(
        AndroidNotificationChannel(
          channelId,
          channelName,
          importance: _importance,
        ),
      );
    } catch (e, st) {
      logError(e, st);
    }
  }

  Future<void> requestNotificationsPermission() async {
    try {
      await _androidPlugin?.requestNotificationsPermission();
    } catch (e, st) {
      logError(e, st);
    }
  }

  Future<void> requestAlarmsPermission([Future<bool> Function()? promptDialog]) async {
    try {
      final alarmsEnabled = await _androidPlugin?.canScheduleExactNotifications();
      if (alarmsEnabled == true) return;

      final confirmed = await promptDialog?.call() ?? true;
      if (confirmed != true) return;

      await _androidPlugin?.requestExactAlarmsPermission();
    } catch (e, st) {
      logError(e, st);
    }
  }

  Future<bool> canSchedule() async {
    try {
      final notificationsEnabled = await _androidPlugin?.areNotificationsEnabled() ?? false;
      final alarmsEnabled = await _androidPlugin?.canScheduleExactNotifications() ?? false;
      return notificationsEnabled && alarmsEnabled;
    } catch (e, st) {
      logError(e, st);
      return false;
    }
  }

  Future<void> show({
    required String channelId,
    required int id,
    String? title,
    String? body,
  }) async {
    try {
      await _plugin?.show(
        id: id,
        title: title,
        body: body,
        notificationDetails: _notificationDetails(channelId, body),
      );
    } catch (e, st) {
      logError(e, st);
    }
  }

  Future<void> schedule({
    required String channelId,
    required int id,
    required DateTime time,
    String? title,
    String? body,
  }) async {
    try {
      await _plugin?.zonedSchedule(
        id: id,
        title: title,
        body: body,
        scheduledDate: tz.TZDateTime.from(time, tz.UTC),
        notificationDetails: _notificationDetails(channelId, body),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
    } catch (e, st) {
      logError(e, st);
    }
  }

  Future<void> cancel(int id) async {
    try {
      await _plugin?.cancel(id: id);
    } catch (e, st) {
      logError(e, st);
    }
  }

  Future<void> cancelRange(({int from, int to}) range) async {
    try {
      for (int id = range.from; id <= range.to; id++) {
        await _plugin?.cancel(id: id);
      }
    } catch (e, st) {
      logError(e, st);
    }
  }

  Future<void> cancelAllPending() async {
    try {
      await _plugin?.cancelAllPendingNotifications();
    } catch (e, st) {
      logError(e, st);
    }
  }

  Future<void> _initPlugin() async {
    try {
      final androidSettings = AndroidInitializationSettings(_defaultIcon);
      final settings = InitializationSettings(android: androidSettings);

      _plugin = FlutterLocalNotificationsPlugin();
      await _plugin?.initialize(settings: settings);

      _androidPlugin = _plugin
          ?.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    } catch (e, st) {
      logError(e, st);
    }
  }

  NotificationDetails _notificationDetails(String channelId, String? body) {
    final style = body != null ? BigTextStyleInformation(body) : null;

    return NotificationDetails(
      android: AndroidNotificationDetails(
        channelId,
        instance._channels[channelId]!,
        importance: _importance,
        priority: _priority,
        styleInformation: style,
      ),
    );
  }
}

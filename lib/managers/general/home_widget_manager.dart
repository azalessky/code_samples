import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';

import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';

class HomeWidgetManager {
  static const dataKey = 'lessons';
  static const providerName = 'WidgetProvider';

  final WidgetRef ref;
  late final AppLifecycleListener _appListener;

  HomeWidgetManager(this.ref);

  void subscribe() {
    ref.listenManual(lessonsProvider, (_, _) => _updateHomeWidget());
    _appListener = AppLifecycleListener(onResume: _updateHomeWidget);
  }

  void dispose() {
    _appListener.dispose();
  }

  Future<void> _updateHomeWidget() async {
    try {
      final lessons = ref.read(lessonsProvider);
      final json = jsonEncode(lessons.map((l) => l.toJson()).toList());

      final current = await HomeWidget.getWidgetData<String>(dataKey);
      if (current == json) return;

      await HomeWidget.saveWidgetData<String>(dataKey, json);
      await HomeWidget.updateWidget(name: providerName);
    } catch (e, st) {
      logError(e, st);
    }
  }
}

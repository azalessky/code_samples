import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/features/profile/widgets/toggle_list_tile.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class AdvancedSettingsScreen extends ConsumerWidget {
  const AdvancedSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(settingsProvider.select((c) => c.advanced));

    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(t.advancedSettingsScreen.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildLessonMode(ref, config),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonMode(WidgetRef ref, AdvancedConfig config) {
    final text = config.lessonMode.enabled
        ? config.lessonMode.value.tr()
        : t.advancedSettingsScreen.lessonModeDisabled;

    return ToggleListTile(
      initialValue: config.lessonMode.enabled,
      leading: const Icon(Symbols.mobile_sound_2),
      title: t.advancedSettingsScreen.lessonMode,
      subtitle: text,
      onTap: () => showModalDialog<LessonMode>(
        builder: (_) => ValueListDialog(
          title: t.advancedSettingsScreen.lessonMode,
          values: LessonMode.values,
          initialValue: config.lessonMode.enabled ? config.lessonMode.value : null,
          textBuilder: (value) => value.tr(),
        ),
        onSaved: (value) => _updateConfig(
          ref,
          config.withLessonMode(enabled: true, value: value),
        ),
      ),
      onToggle: () => _updateConfig(
        ref,
        config.withLessonMode(enabled: !config.lessonMode.enabled),
      ),
    );
  }

  void _updateConfig(WidgetRef ref, AdvancedConfig value) {
    logEvent(AnalyticsEvent.settingsUpdate);

    ref.read(settingsProvider.notifier).advanced = value;
    ref.read(settingsProvider.notifier).save();
  }
}

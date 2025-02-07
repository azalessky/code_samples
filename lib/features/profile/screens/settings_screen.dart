import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/styles/styles.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/features/shared/shared.dart';

@RoutePage()
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final config = ref.watch(settingsProvider);

    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SettingsScreen.Title'.tr()),
      ),
      body: ConstrainedColumn(
        children: [
          _buildThemeMode(config),
          _buildColorTheme(config),
          _buildBackgroundImage(config),
          _buildStudyWeek(config),
          _buildPeriodCount(config),
          _buildRepeatSchedule(config),
          _buildGradingScale(config),
          Spacer(),
          _buildDeleteProfile(),
          FormLayout.sectionSpacer,
        ],
      ),
    );
  }

  Widget _buildThemeMode(Config config) {
    return ListTile(
      leading: const Icon(Symbols.dark_mode),
      title: Text('SettingsScreen.ThemeMode'.tr()),
      subtitle: Text('${config.themeMode}'.tr()),
      onTap: () => showModalDialog<ThemeMode>(
        context: context,
        builder: (_) => ValueListDialog(
          title: 'SettingsScreen.ThemeMode'.tr(),
          values: ThemeMode.values,
          initialValue: config.themeMode,
          textBuilder: (value) => '$value'.tr(),
        ),
        onSaved: (value) => _updateThemeMode(value),
      ),
    );
  }

  Widget _buildColorTheme(Config config) {
    final oldColor = config.colorTheme;

    return ListTile(
      leading: const Icon(Symbols.palette),
      title: Text('SettingsScreen.ColorTheme'.tr()),
      subtitle: Text(themes.getColorName(config.colorTheme)),
      onTap: () => showModalDialog<Color>(
        context: context,
        builder: (_) => ColorPickerDialog(
          title: 'SettingsScreen.ColorTheme'.tr(),
          values: themes.colors.keys.toList(),
          initialValue: config.colorTheme,
          onChanged: (color) => _updateColorTheme(color),
        ),
        onCancelled: () => _updateColorTheme(oldColor),
      ),
    );
  }

  Widget _buildBackgroundImage(Config config) {
    return ListTile(
      leading: const Icon(Symbols.image),
      title: Text('SettingsScreen.BackgroundImage'.tr()),
      subtitle: Text(Background(config.backgroundImage).getDisplayName()),
      onTap: () => showModalDialog<Background>(
        context: context,
        builder: (_) => BackgroundDialog(
          title: 'SettingsScreen.BackgroundImage'.tr(),
          initialValue: Background.fromPath(config.backgroundImage),
          backgrounds: Background.fromManifest(resources.assetManifest),
        ),
        onSaved: (value) => _updateBackgroundImage(value.name),
      ),
    );
  }

  Widget _buildStudyWeek(Config config) {
    return ListTile(
      leading: const Icon(Symbols.date_range),
      title: Text('SettingsScreen.StudyWeek'.tr()),
      subtitle: Text(config.studyWeek.displayText()),
      onTap: () => showModalDialog<List<bool>>(
        context: context,
        builder: (context) => CheckboxListDialog(
          title: 'SettingsScreen.StudyWeek'.tr(),
          items: DateHelper.getNamesOfWeekDays(),
          values: config.studyWeek.days,
          onValidate: (values) => values.contains(true),
        ),
        onSaved: (value) => _updateStudyWeek(StudyWeek(days: value)),
      ),
    );
  }

  Widget _buildPeriodCount(Config config) {
    return ListTile(
      leading: const Icon(Symbols.notifications),
      title: Text('SettingsScreen.PeriodCount'.tr()),
      subtitle: const Text('SettingsScreen.PeriodCountText').tr(
        args: [config.periodCount.toString()],
      ),
      onTap: () => showModalDialog<int>(
        context: context,
        builder: (context) => ValueListDialog(
          title: 'SettingsScreen.PeriodCount'.tr(),
          values: const [4, 5, 6, 7, 8, 9, 10],
          initialValue: config.periodCount,
          textBuilder: (value) => value.toString(),
          alignment: Alignment.center,
        ),
        onSaved: (value) => _updatePeriodCount(value),
      ),
    );
  }

  Widget _buildRepeatSchedule(Config config) {
    return ListTile(
      leading: const Icon(Symbols.event_repeat),
      title: Text('SettingsScreen.RepeatSchedule'.tr()),
      subtitle: Text(config.repeatSchedule.toString().tr()),
      onTap: () => showModalDialog<RepeatSchedule>(
        context: context,
        builder: (context) => ValueListDialog(
          title: 'SettingsScreen.RepeatSchedule'.tr(),
          values: RepeatSchedule.values,
          initialValue: config.repeatSchedule,
          textBuilder: (value) => value.toString().tr(),
        ),
        onSaved: (value) => _updateRepeatSchedule(value),
      ),
    );
  }

  Widget _buildGradingScale(Config config) {
    return ListTile(
      leading: const Icon(Symbols.grade),
      title: Text('SettingsScreen.GradingScale'.tr()),
      subtitle: Text(config.gradingScale.toString().tr()),
      onTap: () => showModalDialog<GradingScale>(
        context: context,
        builder: (_) => ValueListDialog(
          title: 'SettingsScreen.GradingScale'.tr(),
          values: GradingScale.values,
          initialValue: config.gradingScale,
          textBuilder: (value) => value.toString().tr(),
        ),
        onSaved: (value) => _updateGradingScale(value),
      ),
    );
  }

  Widget _buildDeleteProfile() {
    return TextButton.icon(
      label: Text('SettingsScreen.DeleteProfile'.tr()),
      icon: Icon(Symbols.delete),
      onPressed: () => showPromptDialog(
        context: context,
        title: 'Prompt.Confirmation'.tr(),
        text: 'Prompt.DeleteProfile'.tr(),
        onConfirmed: () => _deleteProfile(),
      ),
    );
  }

  void _updateThemeMode(ThemeMode value) {
    logEvent(AnalyticsEvent.settingsUpdate);
    ref.read(settingsProvider.notifier).themeMode = value;
    cachedRepository.saveData();
  }

  void _updateColorTheme(Color value) {
    logEvent(AnalyticsEvent.settingsUpdate);
    ref.read(settingsProvider.notifier).colorTheme = value;
    cachedRepository.saveData();
  }

  void _updateBackgroundImage(String value) {
    logEvent(AnalyticsEvent.settingsUpdate);
    ref.read(settingsProvider.notifier).backgroundImage = value;
    cachedRepository.saveData();
  }

  void _updateStudyWeek(StudyWeek value) {
    logEvent(AnalyticsEvent.settingsUpdate);
    ref.read(settingsProvider.notifier).studyWeek = value;
    cachedRepository.saveData();
  }

  void _updatePeriodCount(int value) {
    logEvent(AnalyticsEvent.settingsUpdate);
    ref.read(settingsProvider.notifier).periodCount = value;
    cachedRepository.saveData();
  }

  void _updateGradingScale(GradingScale value) {
    logEvent(AnalyticsEvent.settingsUpdate);
    ref.read(settingsProvider.notifier).gradingScale = value;
    cachedRepository.saveData();
  }

  void _updateRepeatSchedule(RepeatSchedule value) {
    logEvent(AnalyticsEvent.settingsUpdate);
    ref.read(settingsProvider.notifier).repeatSchedule = value;
    ref.read(periodsProvider.notifier).repeatPeriods(value);
    cachedRepository.saveData();
  }

  Future<void> _deleteProfile() async {
    logEvent(AnalyticsEvent.settingsDeleteProfile);
    await profileManager.deleteData(context, authService.isSignedIn);
  }
}

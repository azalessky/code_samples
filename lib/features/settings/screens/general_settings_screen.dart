import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/shared/shared.dart';

@RoutePage()
class GeneralSettingsScreen extends ConsumerWidget {
  const GeneralSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(settingsProvider.select((c) => c.general));

    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(t.generalSettingsScreen.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildAppLanguage(ref, config),
            _buildThemeMode(ref, config),
            _buildBaseColor(ref, config),
            _buildBackgroundImage(context, ref, config),
            _buildAppFont(context, ref, config),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeMode(WidgetRef ref, GeneralConfig config) {
    return ListTile(
      leading: const Icon(Symbols.dark_mode),
      title: Text(t.generalSettingsScreen.themeMode),
      subtitle: Text(config.themeMode.tr()),
      onTap: () => showModalDialog<ThemeMode>(
        builder: (_) => ValueListDialog(
          title: t.generalSettingsScreen.themeMode,
          values: ThemeMode.values,
          initialValue: config.themeMode,
          textBuilder: (value) => value.tr(),
        ),
        onSaved: (value) => _updateConfig(
          ref,
          config.copyWith(
            themeMode: value,
            backgroundImage: value == config.themeMode ? config.backgroundImage : '',
          ),
        ),
      ),
    );
  }

  Widget _buildAppLanguage(WidgetRef ref, GeneralConfig config) {
    return ListTile(
      leading: const Icon(Symbols.language),
      title: Text(t.generalSettingsScreen.appLanguage),
      subtitle: Text(LocaleHelper.languageNames[config.appLanguage] ?? ''),
      onTap: () => showModalDialog<String>(
        builder: (_) => ValueListDialog(
          title: t.generalSettingsScreen.appLanguage,
          values: LocaleHelper.supportedLocales,
          initialValue: config.appLanguage,
          textBuilder: (value) => LocaleHelper.languageNames[value] ?? '',
        ),
        onSaved: (value) => _updateConfig(ref, config.copyWith(appLanguage: value)),
      ),
    );
  }

  Widget _buildBaseColor(WidgetRef ref, GeneralConfig config) {
    return ListTile(
      leading: const Icon(Symbols.palette),
      title: Text(t.generalSettingsScreen.baseColor),
      subtitle: Text(Palette.nameOf(config.baseColor)),
      onTap: () => showModalDialog<Color>(
        builder: (_) => ColorPickerDialog(
          title: t.generalSettingsScreen.baseColor,
          values: Palette.colors,
          initialValue: config.baseColor,
        ),
        onSaved: (value) => _updateConfig(ref, config.copyWith(baseColor: value)),
      ),
    );
  }

  Widget _buildBackgroundImage(BuildContext context, WidgetRef ref, GeneralConfig config) {
    return ListTile(
      leading: const Icon(Symbols.image),
      title: Text(t.generalSettingsScreen.backgroundImage),
      subtitle: Text(
        Background(
          config.backgroundImage,
        ).displayName.ifEmpty(t.generalSettingsScreen.backgroundImageNone),
      ),
      onTap: () => showModalDialog<Background>(
        builder: (_) => BackgroundDialog(
          title: t.generalSettingsScreen.backgroundImage,
          initialValue: Background(config.backgroundImage),
          backgrounds: Background.assetList(Theme.brightnessOf(context)),
        ),
        onSaved: (value) => _updateConfig(ref, config.copyWith(backgroundImage: value.path)),
      ),
    );
  }

  Widget _buildAppFont(BuildContext context, WidgetRef ref, GeneralConfig config) {
    return ListTile(
      leading: const Icon(Symbols.slab_serif),
      title: Text(t.generalSettingsScreen.appFont),
      subtitle: Text(config.appFont),
      onTap: () => showModalDialog<String>(
        builder: (_) => ValueListDialog(
          title: t.generalSettingsScreen.appFont,
          initialValue: config.appFont,
          values: resources.getFonts(),
          itemBuilder: (value) => Text(
            value,
            style: GoogleFonts.getFont(value),
          ),
        ),
        onSaved: (value) => _updateConfig(ref, config.copyWith(appFont: value)),
      ),
    );
  }

  void _updateConfig(WidgetRef ref, GeneralConfig value) {
    logEvent(AnalyticsEvent.settingsUpdate);

    ref.read(settingsProvider.notifier).general = value;
    ref.read(settingsProvider.notifier).save();
  }
}

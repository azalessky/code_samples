import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

class Themes {
  static ThemeData lightTheme(
    GeneralConfig config,
  ) => _buildTheme(
    Brightness.light,
    config.baseColor,
    config.appFont,
    config.backgroundImage.isNotEmpty,
  );

  static ThemeData darkTheme(
    GeneralConfig config,
  ) => _buildTheme(
    Brightness.dark,
    config.baseColor,
    config.appFont,
    config.backgroundImage.isNotEmpty,
  );

  static ThemeData _buildTheme(
    Brightness brightness,
    Color seedColor,
    String fontFamily,
    bool hasBackground,
  ) {
    final colorScheme = ColorScheme.fromSeed(brightness: brightness, seedColor: seedColor);
    final themeData = ThemeData(brightness: brightness, colorScheme: colorScheme);

    final textTheme = Themes._getTextTheme(fontFamily, themeData.textTheme).apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );

    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(FormStyles.inputRadius),
    );

    final inputEnabledBorder = inputBorder.copyWith(
      borderSide: BorderSide(color: colorScheme.outlineVariant),
    );

    final inputFocusedBorder = inputBorder.copyWith(
      borderSide: BorderSide(color: colorScheme.outline),
    );

    final inputErrorBorder = inputBorder.copyWith(
      borderSide: BorderSide(color: colorScheme.error),
    );

    return themeData.copyWith(
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      textTheme: textTheme,
      scaffoldBackgroundColor: hasBackground ? Colors.transparent : null,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.black.withValues(
          alpha: FormStyles.inputAlpha * (brightness == Brightness.light ? 1 : 2),
        ),
        isDense: true,
        border: InputBorder.none,
        errorStyle: const TextStyle(height: 0.01),
        enabledBorder: inputEnabledBorder,
        disabledBorder: inputEnabledBorder,
        focusedBorder: inputFocusedBorder,
        errorBorder: inputErrorBorder,
        focusedErrorBorder: inputErrorBorder,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: brightness == Brightness.light
              ? Brightness.dark
              : Brightness.light,
        ),
      ),
      tabBarTheme: const TabBarThemeData(
        dividerColor: Colors.transparent,
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(FormStyles.checkboxRadius),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outline.withValues(alpha: FormStyles.dividerAlpha),
      ),
    );
  }

  static Color alpha(BuildContext context, Color color, double alpha, {bool inverse = false}) {
    final brightness = Theme.brightnessOf(context);
    return _applyAlpha(brightness, color, alpha, inverse: inverse);
  }

  static Color _applyAlpha(
    Brightness brightness,
    Color color,
    double alpha, {
    bool inverse = false,
  }) {
    final factor = brightness == Brightness.light ? 1.25 : 1.0;
    final adjusted = inverse ? alpha / factor : alpha * factor;

    return color.withValues(alpha: adjusted.clamp(0, 1.0));
  }

  static TextTheme _getTextTheme(String fontFamily, TextTheme defaultValue) {
    try {
      return GoogleFonts.getTextTheme(fontFamily);
    } catch (_) {
      return defaultValue;
    }
  }
}

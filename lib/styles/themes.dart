import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:student_planner/common/common.dart';

class Themes {
  final Map<Color, String> colors = {
    Colors.red.shade500: 'red',
    Colors.pink.shade500: 'pink',
    Colors.purple.shade500: 'purple',
    Colors.deepPurple.shade500: 'deepPurple',
    Colors.indigo.shade500: 'indigo',
    Colors.blue.shade500: 'blue',
    Colors.lightBlue.shade500: 'lightBlue',
    Colors.cyan.shade500: 'cyan',
    Colors.teal.shade500: 'teal',
    Colors.green.shade500: 'green',
    Colors.lightGreen.shade500: 'lightGreen',
    Colors.lime.shade500: 'lime',
    Colors.yellow.shade500: 'yellow',
    Colors.amber.shade500: 'amber',
    Colors.orange.shade500: 'orange',
    Colors.blueGrey.shade500: 'blueGrey',
  };

  ThemeData lightTheme(Color color, bool hasBackground) =>
      _buildTheme(Brightness.light, color, hasBackground);
  ThemeData darkTheme(Color color, bool hasBackground) =>
      _buildTheme(Brightness.dark, color, hasBackground);

  String getColorName(Color color) {
    return colors.containsKey(color) ? 'Color.${colors[color]}'.tr() : 'undefined';
  }

  ThemeData _buildTheme(Brightness brightness, Color color, bool hasBackground) {
    final themeData = ThemeData(
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(brightness: brightness, seedColor: color),
    );

    final colorScheme = themeData.colorScheme;
    final textTheme = GoogleFonts.latoTextTheme(themeData.textTheme);

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
      textTheme: textTheme,
      scaffoldBackgroundColor:
          hasBackground ? Colors.transparent : themeData.scaffoldBackgroundColor,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: hasBackground
            ? Colors.transparent.withAlpha(FormStyles.inputAlpha)
            : colorScheme.surfaceContainerHighest,
        isDense: true,
        border: InputBorder.none,
        errorStyle: const TextStyle(height: 0.01),
        enabledBorder: inputEnabledBorder,
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
          statusBarIconBrightness:
              brightness == Brightness.light ? Brightness.dark : Brightness.light,
        ),
      ),
      tabBarTheme: const TabBarTheme(
        dividerColor: Colors.transparent,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
        indicatorColor: Colors.transparent,
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(FormStyles.checkboxRadius),
        ),
      ),
    );
  }
}

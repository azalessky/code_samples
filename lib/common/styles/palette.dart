import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';

class Palette {
  static const Color red = Color(0xFFF44336);
  static const Color pink = Color(0xFFE91E63);
  static const Color purple = Color(0xFF9C27B0);
  static const Color deepPurple = Color(0xFF673AB7);
  static const Color indigo = Color(0xFF3F51B5);
  static const Color blue = Color(0xFF2196F3);
  static const Color lightBlue = Color(0xFF03A9F4);
  static const Color cyan = Color(0xFF00BCD4);
  static const Color teal = Color(0xFF009688);
  static const Color green = Color(0xFF4CAF50);
  static const Color lightGreen = Color(0xFF8BC34A);
  static const Color lime = Color(0xFFCDDC39);
  static const Color yellow = Color(0xFFFFEB3B);
  static const Color amber = Color(0xFFFFC107);
  static const Color orange = Color(0xFFFF9800);
  static const Color blueGrey = Color(0xFF607D8B);

  static const List<Color> colors = [
    red,
    pink,
    purple,
    deepPurple,
    indigo,
    blue,
    lightBlue,
    cyan,
    teal,
    green,
    lightGreen,
    lime,
    yellow,
    amber,
    orange,
    blueGrey,
  ];

  static String nameOf(Color color) {
    final names = {
      red: 'red',
      pink: 'pink',
      purple: 'purple',
      deepPurple: 'deepPurple',
      indigo: 'indigo',
      blue: 'blue',
      lightBlue: 'lightBlue',
      cyan: 'cyan',
      teal: 'teal',
      green: 'green',
      lightGreen: 'lightGreen',
      lime: 'lime',
      yellow: 'yellow',
      amber: 'amber',
      orange: 'orange',
      blueGrey: 'blueGrey',
    };

    final name = names[color];
    return name == null ? '' : 'color.$name'.tr();
  }
}

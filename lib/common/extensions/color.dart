import 'package:flutter/material.dart';

extension ColorExtension on Color {
  String toStringHex() {
    return '#${toARGB32().toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }
}

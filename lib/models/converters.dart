import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class ColorConverter implements JsonConverter<Color, String?> {
  const ColorConverter();

  @override
  Color fromJson(String? json) {
    try {
      return Color(int.parse(json!));
    } catch (e) {
      return Colors.blue.shade500;
    }
  }

  @override
  // ignore: deprecated_member_use
  String? toJson(Color value) => value.value.toString().toUpperCase();
}

class TimeOfDayConverter implements JsonConverter<TimeOfDay, String?> {
  const TimeOfDayConverter();

  @override
  TimeOfDay fromJson(String? json) => TimeOfDay(
        hour: int.parse(json!.split(':')[0]),
        minute: int.parse(json.split(':')[1]),
      );

  @override
  String? toJson(TimeOfDay value) {
    String addLeadingZero(int value) {
      return value < 10 ? '0$value' : value.toString();
    }

    final hours = addLeadingZero(value.hour);
    final minutes = addLeadingZero(value.minute);
    return '$hours:$minutes';
  }
}

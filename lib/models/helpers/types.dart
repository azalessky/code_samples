import 'package:flutter/material.dart';

typedef DateRange = ({DateTime start, DateTime end});
typedef ColorRange = ({int from, int to, Color color});
typedef CheckItem = ({String text, bool checked});
typedef EnabledValue<T> = ({bool enabled, T value});

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/models/models.dart';
import 'package:student_planner/shared/shared.dart';

class HolidayPlaceholder extends StatelessWidget {
  final Term holiday;
  final bool compact;

  const HolidayPlaceholder({
    required this.holiday,
    this.compact = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final icon = switch (holiday.type) {
      TermType.vacation => Symbols.beach_access,
      TermType.holiday => Symbols.celebration,
      _ => Symbols.error,
    };

    return SpacePlaceholder(
      text: holiday.name,
      icon: icon,
      compact: compact,
    );
  }
}

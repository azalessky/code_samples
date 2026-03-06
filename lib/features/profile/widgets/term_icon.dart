import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/models/models.dart';

class TermIcon extends StatelessWidget {
  final TermType type;

  const TermIcon({
    required this.type,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      TermType.year => const Icon(Symbols.calendar_month),
      TermType.study => const Icon(Symbols.school),
      TermType.vacation => const Icon(Symbols.beach_access),
      TermType.holiday => const Icon(Symbols.celebration),
    };
  }
}

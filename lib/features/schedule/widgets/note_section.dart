import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/features/schedule/schedule.dart';

class NoteSection extends ConsumerWidget {
  final DateTime date;
  final String? hintText;

  const NoteSection({
    super.key,
    required this.date,
    this.hintText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final note = ref.read(notesProvider.notifier).getNote(date);
    final borderColor = Theme.of(context).colorScheme.outline;

    return NoteText(
      note: note,
      date: date,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: borderColor)),
      ),
      hintText: hintText,
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

class NoteText extends StatelessWidget {
  final Note? note;
  final DateTime? date;
  final Decoration? decoration;
  final String? hintText;

  const NoteText({
    this.note,
    this.date,
    this.decoration,
    this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FormLayout.formPadding,
      child: InkWell(
        onTap: () => context.pushRoute(
          NoteDetailRoute(note: note, date: date),
        ),
        child: Container(
          width: double.infinity,
          padding: FormLayout.textPadding,
          decoration: decoration,
          child: Text(
            note?.text ?? hintText ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ),
    );
  }
}

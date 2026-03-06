import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

class ShareActionManager {
  static void shareContent(BuildContext context, Period? period, Assignment assignment) {
    final date = period?.date ?? assignment.date;
    final subject = period?.subject ?? assignment.subject;
    final topic = period?.topic ?? '';
    final content = assignment.content.format();
    final files = assignment.images.map((image) => XFile(image)).toList();

    final text = StringBuffer();
    text.writeln(date.format(DateFormat.MONTH_WEEKDAY_DAY));
    if (subject.isNotEmpty) text.writeln(subject);
    if (topic.isNotEmpty) text.writeln(topic);
    if (content.isNotEmpty) text.writeln(content);

    SharePlus.instance.share(
      ShareParams(text: text.toString(), files: files.isEmpty ? null : files),
    );
  }
}

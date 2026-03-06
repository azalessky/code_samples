import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_planner/models/models.dart';

part 'assignment_content.freezed.dart';
part 'assignment_content.g.dart';

@Freezed(unionKey: 'type')
sealed class AssignmentContent with _$AssignmentContent {
  const AssignmentContent._();

  const factory AssignmentContent.text(String text) = TextContent;
  const factory AssignmentContent.list(List<CheckItem> items) = ListContent;

  factory AssignmentContent.fromJson(Map<String, dynamic> json) =>
      _$AssignmentContentFromJson(json);

  factory AssignmentContent.empty() => const AssignmentContent.text('');

  bool get isEmpty => when(
    text: (text) => text.trim().isEmpty,
    list: (items) => items.every((e) => e.text.trim().isEmpty),
  );

  bool get isNotEmpty => !isEmpty;

  String format() => when(
    text: (text) => text.trim(),
    list: (items) => items.map((e) => e.text.trim()).join('\n'),
  );

  AssignmentContent convert() {
    return switch (this) {
      TextContent(:final text) => AssignmentContent.list(
        text
            .split('\n')
            .map((line) => line.trim())
            .where((line) => line.isNotEmpty)
            .map((line) => (text: line, checked: false))
            .toList(),
      ),
      ListContent(:final items) => AssignmentContent.text(
        items.map((e) => e.text.trim()).join('\n'),
      ),
    };
  }
}

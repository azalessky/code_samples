import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson.freezed.dart';
part 'lesson.g.dart';

@freezed
abstract class Lesson with _$Lesson implements Comparable<Lesson> {
  const Lesson._();

  const factory Lesson({
    required String id,
    required DateTime start,
    required DateTime end,
    required String subject,
    required String room,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  @override
  int compareTo(Lesson other) => start.compareTo(other.start);
}

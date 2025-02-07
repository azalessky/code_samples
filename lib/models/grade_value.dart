import 'package:freezed_annotation/freezed_annotation.dart';

part 'grade_value.freezed.dart';
part 'grade_value.g.dart';

@freezed
class GradeValue with _$GradeValue {
  const GradeValue._();

  const factory GradeValue({
    required String value,
    required double weight,
  }) = _GradeValue;

  factory GradeValue.fromJson(Map<String, dynamic> json) => _$GradeValueFromJson(json);

  factory GradeValue.empty() => GradeValue(value: '', weight: 0);

  bool get isEmpty => value.isEmpty;
  bool get isNotEmpty => value.isNotEmpty;
}

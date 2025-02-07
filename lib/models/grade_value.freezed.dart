// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grade_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GradeValue _$GradeValueFromJson(Map<String, dynamic> json) {
  return _GradeValue.fromJson(json);
}

/// @nodoc
mixin _$GradeValue {
  String get value => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;

  /// Serializes this GradeValue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GradeValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GradeValueCopyWith<GradeValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GradeValueCopyWith<$Res> {
  factory $GradeValueCopyWith(
          GradeValue value, $Res Function(GradeValue) then) =
      _$GradeValueCopyWithImpl<$Res, GradeValue>;
  @useResult
  $Res call({String value, double weight});
}

/// @nodoc
class _$GradeValueCopyWithImpl<$Res, $Val extends GradeValue>
    implements $GradeValueCopyWith<$Res> {
  _$GradeValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GradeValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? weight = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GradeValueImplCopyWith<$Res>
    implements $GradeValueCopyWith<$Res> {
  factory _$$GradeValueImplCopyWith(
          _$GradeValueImpl value, $Res Function(_$GradeValueImpl) then) =
      __$$GradeValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, double weight});
}

/// @nodoc
class __$$GradeValueImplCopyWithImpl<$Res>
    extends _$GradeValueCopyWithImpl<$Res, _$GradeValueImpl>
    implements _$$GradeValueImplCopyWith<$Res> {
  __$$GradeValueImplCopyWithImpl(
      _$GradeValueImpl _value, $Res Function(_$GradeValueImpl) _then)
      : super(_value, _then);

  /// Create a copy of GradeValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? weight = null,
  }) {
    return _then(_$GradeValueImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GradeValueImpl extends _GradeValue {
  const _$GradeValueImpl({required this.value, required this.weight})
      : super._();

  factory _$GradeValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$GradeValueImplFromJson(json);

  @override
  final String value;
  @override
  final double weight;

  @override
  String toString() {
    return 'GradeValue(value: $value, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GradeValueImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, weight);

  /// Create a copy of GradeValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GradeValueImplCopyWith<_$GradeValueImpl> get copyWith =>
      __$$GradeValueImplCopyWithImpl<_$GradeValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GradeValueImplToJson(
      this,
    );
  }
}

abstract class _GradeValue extends GradeValue {
  const factory _GradeValue(
      {required final String value,
      required final double weight}) = _$GradeValueImpl;
  const _GradeValue._() : super._();

  factory _GradeValue.fromJson(Map<String, dynamic> json) =
      _$GradeValueImpl.fromJson;

  @override
  String get value;
  @override
  double get weight;

  /// Create a copy of GradeValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GradeValueImplCopyWith<_$GradeValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

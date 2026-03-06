// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grades_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GradesConfig {

 GradeScale get gradeScale; double get plusValue; double get minusValue; double get roundingThreshold; int get roundingPrecision;@ColorConverter() List<ColorRange> get gradeColors; List<String> get attendanceMarks;
/// Create a copy of GradesConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GradesConfigCopyWith<GradesConfig> get copyWith => _$GradesConfigCopyWithImpl<GradesConfig>(this as GradesConfig, _$identity);

  /// Serializes this GradesConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GradesConfig&&(identical(other.gradeScale, gradeScale) || other.gradeScale == gradeScale)&&(identical(other.plusValue, plusValue) || other.plusValue == plusValue)&&(identical(other.minusValue, minusValue) || other.minusValue == minusValue)&&(identical(other.roundingThreshold, roundingThreshold) || other.roundingThreshold == roundingThreshold)&&(identical(other.roundingPrecision, roundingPrecision) || other.roundingPrecision == roundingPrecision)&&const DeepCollectionEquality().equals(other.gradeColors, gradeColors)&&const DeepCollectionEquality().equals(other.attendanceMarks, attendanceMarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gradeScale,plusValue,minusValue,roundingThreshold,roundingPrecision,const DeepCollectionEquality().hash(gradeColors),const DeepCollectionEquality().hash(attendanceMarks));

@override
String toString() {
  return 'GradesConfig(gradeScale: $gradeScale, plusValue: $plusValue, minusValue: $minusValue, roundingThreshold: $roundingThreshold, roundingPrecision: $roundingPrecision, gradeColors: $gradeColors, attendanceMarks: $attendanceMarks)';
}


}

/// @nodoc
abstract mixin class $GradesConfigCopyWith<$Res>  {
  factory $GradesConfigCopyWith(GradesConfig value, $Res Function(GradesConfig) _then) = _$GradesConfigCopyWithImpl;
@useResult
$Res call({
 GradeScale gradeScale, double plusValue, double minusValue, double roundingThreshold, int roundingPrecision,@ColorConverter() List<ColorRange> gradeColors, List<String> attendanceMarks
});




}
/// @nodoc
class _$GradesConfigCopyWithImpl<$Res>
    implements $GradesConfigCopyWith<$Res> {
  _$GradesConfigCopyWithImpl(this._self, this._then);

  final GradesConfig _self;
  final $Res Function(GradesConfig) _then;

/// Create a copy of GradesConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gradeScale = null,Object? plusValue = null,Object? minusValue = null,Object? roundingThreshold = null,Object? roundingPrecision = null,Object? gradeColors = null,Object? attendanceMarks = null,}) {
  return _then(_self.copyWith(
gradeScale: null == gradeScale ? _self.gradeScale : gradeScale // ignore: cast_nullable_to_non_nullable
as GradeScale,plusValue: null == plusValue ? _self.plusValue : plusValue // ignore: cast_nullable_to_non_nullable
as double,minusValue: null == minusValue ? _self.minusValue : minusValue // ignore: cast_nullable_to_non_nullable
as double,roundingThreshold: null == roundingThreshold ? _self.roundingThreshold : roundingThreshold // ignore: cast_nullable_to_non_nullable
as double,roundingPrecision: null == roundingPrecision ? _self.roundingPrecision : roundingPrecision // ignore: cast_nullable_to_non_nullable
as int,gradeColors: null == gradeColors ? _self.gradeColors : gradeColors // ignore: cast_nullable_to_non_nullable
as List<ColorRange>,attendanceMarks: null == attendanceMarks ? _self.attendanceMarks : attendanceMarks // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [GradesConfig].
extension GradesConfigPatterns on GradesConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GradesConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GradesConfig() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GradesConfig value)  $default,){
final _that = this;
switch (_that) {
case _GradesConfig():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GradesConfig value)?  $default,){
final _that = this;
switch (_that) {
case _GradesConfig() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GradeScale gradeScale,  double plusValue,  double minusValue,  double roundingThreshold,  int roundingPrecision, @ColorConverter()  List<ColorRange> gradeColors,  List<String> attendanceMarks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GradesConfig() when $default != null:
return $default(_that.gradeScale,_that.plusValue,_that.minusValue,_that.roundingThreshold,_that.roundingPrecision,_that.gradeColors,_that.attendanceMarks);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GradeScale gradeScale,  double plusValue,  double minusValue,  double roundingThreshold,  int roundingPrecision, @ColorConverter()  List<ColorRange> gradeColors,  List<String> attendanceMarks)  $default,) {final _that = this;
switch (_that) {
case _GradesConfig():
return $default(_that.gradeScale,_that.plusValue,_that.minusValue,_that.roundingThreshold,_that.roundingPrecision,_that.gradeColors,_that.attendanceMarks);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GradeScale gradeScale,  double plusValue,  double minusValue,  double roundingThreshold,  int roundingPrecision, @ColorConverter()  List<ColorRange> gradeColors,  List<String> attendanceMarks)?  $default,) {final _that = this;
switch (_that) {
case _GradesConfig() when $default != null:
return $default(_that.gradeScale,_that.plusValue,_that.minusValue,_that.roundingThreshold,_that.roundingPrecision,_that.gradeColors,_that.attendanceMarks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GradesConfig implements GradesConfig {
  const _GradesConfig({required this.gradeScale, required this.plusValue, required this.minusValue, required this.roundingThreshold, required this.roundingPrecision, @ColorConverter() required final  List<ColorRange> gradeColors, required final  List<String> attendanceMarks}): _gradeColors = gradeColors,_attendanceMarks = attendanceMarks;
  factory _GradesConfig.fromJson(Map<String, dynamic> json) => _$GradesConfigFromJson(json);

@override final  GradeScale gradeScale;
@override final  double plusValue;
@override final  double minusValue;
@override final  double roundingThreshold;
@override final  int roundingPrecision;
 final  List<ColorRange> _gradeColors;
@override@ColorConverter() List<ColorRange> get gradeColors {
  if (_gradeColors is EqualUnmodifiableListView) return _gradeColors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_gradeColors);
}

 final  List<String> _attendanceMarks;
@override List<String> get attendanceMarks {
  if (_attendanceMarks is EqualUnmodifiableListView) return _attendanceMarks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attendanceMarks);
}


/// Create a copy of GradesConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GradesConfigCopyWith<_GradesConfig> get copyWith => __$GradesConfigCopyWithImpl<_GradesConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GradesConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GradesConfig&&(identical(other.gradeScale, gradeScale) || other.gradeScale == gradeScale)&&(identical(other.plusValue, plusValue) || other.plusValue == plusValue)&&(identical(other.minusValue, minusValue) || other.minusValue == minusValue)&&(identical(other.roundingThreshold, roundingThreshold) || other.roundingThreshold == roundingThreshold)&&(identical(other.roundingPrecision, roundingPrecision) || other.roundingPrecision == roundingPrecision)&&const DeepCollectionEquality().equals(other._gradeColors, _gradeColors)&&const DeepCollectionEquality().equals(other._attendanceMarks, _attendanceMarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gradeScale,plusValue,minusValue,roundingThreshold,roundingPrecision,const DeepCollectionEquality().hash(_gradeColors),const DeepCollectionEquality().hash(_attendanceMarks));

@override
String toString() {
  return 'GradesConfig(gradeScale: $gradeScale, plusValue: $plusValue, minusValue: $minusValue, roundingThreshold: $roundingThreshold, roundingPrecision: $roundingPrecision, gradeColors: $gradeColors, attendanceMarks: $attendanceMarks)';
}


}

/// @nodoc
abstract mixin class _$GradesConfigCopyWith<$Res> implements $GradesConfigCopyWith<$Res> {
  factory _$GradesConfigCopyWith(_GradesConfig value, $Res Function(_GradesConfig) _then) = __$GradesConfigCopyWithImpl;
@override @useResult
$Res call({
 GradeScale gradeScale, double plusValue, double minusValue, double roundingThreshold, int roundingPrecision,@ColorConverter() List<ColorRange> gradeColors, List<String> attendanceMarks
});




}
/// @nodoc
class __$GradesConfigCopyWithImpl<$Res>
    implements _$GradesConfigCopyWith<$Res> {
  __$GradesConfigCopyWithImpl(this._self, this._then);

  final _GradesConfig _self;
  final $Res Function(_GradesConfig) _then;

/// Create a copy of GradesConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gradeScale = null,Object? plusValue = null,Object? minusValue = null,Object? roundingThreshold = null,Object? roundingPrecision = null,Object? gradeColors = null,Object? attendanceMarks = null,}) {
  return _then(_GradesConfig(
gradeScale: null == gradeScale ? _self.gradeScale : gradeScale // ignore: cast_nullable_to_non_nullable
as GradeScale,plusValue: null == plusValue ? _self.plusValue : plusValue // ignore: cast_nullable_to_non_nullable
as double,minusValue: null == minusValue ? _self.minusValue : minusValue // ignore: cast_nullable_to_non_nullable
as double,roundingThreshold: null == roundingThreshold ? _self.roundingThreshold : roundingThreshold // ignore: cast_nullable_to_non_nullable
as double,roundingPrecision: null == roundingPrecision ? _self.roundingPrecision : roundingPrecision // ignore: cast_nullable_to_non_nullable
as int,gradeColors: null == gradeColors ? _self._gradeColors : gradeColors // ignore: cast_nullable_to_non_nullable
as List<ColorRange>,attendanceMarks: null == attendanceMarks ? _self._attendanceMarks : attendanceMarks // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on

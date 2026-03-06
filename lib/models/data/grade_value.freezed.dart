// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grade_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GradeValue {

 String get value; double get weight;
/// Create a copy of GradeValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GradeValueCopyWith<GradeValue> get copyWith => _$GradeValueCopyWithImpl<GradeValue>(this as GradeValue, _$identity);

  /// Serializes this GradeValue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GradeValue&&(identical(other.value, value) || other.value == value)&&(identical(other.weight, weight) || other.weight == weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,weight);

@override
String toString() {
  return 'GradeValue(value: $value, weight: $weight)';
}


}

/// @nodoc
abstract mixin class $GradeValueCopyWith<$Res>  {
  factory $GradeValueCopyWith(GradeValue value, $Res Function(GradeValue) _then) = _$GradeValueCopyWithImpl;
@useResult
$Res call({
 String value, double weight
});




}
/// @nodoc
class _$GradeValueCopyWithImpl<$Res>
    implements $GradeValueCopyWith<$Res> {
  _$GradeValueCopyWithImpl(this._self, this._then);

  final GradeValue _self;
  final $Res Function(GradeValue) _then;

/// Create a copy of GradeValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? weight = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [GradeValue].
extension GradeValuePatterns on GradeValue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GradeValue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GradeValue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GradeValue value)  $default,){
final _that = this;
switch (_that) {
case _GradeValue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GradeValue value)?  $default,){
final _that = this;
switch (_that) {
case _GradeValue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  double weight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GradeValue() when $default != null:
return $default(_that.value,_that.weight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  double weight)  $default,) {final _that = this;
switch (_that) {
case _GradeValue():
return $default(_that.value,_that.weight);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  double weight)?  $default,) {final _that = this;
switch (_that) {
case _GradeValue() when $default != null:
return $default(_that.value,_that.weight);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GradeValue extends GradeValue {
  const _GradeValue({required this.value, required this.weight}): super._();
  factory _GradeValue.fromJson(Map<String, dynamic> json) => _$GradeValueFromJson(json);

@override final  String value;
@override final  double weight;

/// Create a copy of GradeValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GradeValueCopyWith<_GradeValue> get copyWith => __$GradeValueCopyWithImpl<_GradeValue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GradeValueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GradeValue&&(identical(other.value, value) || other.value == value)&&(identical(other.weight, weight) || other.weight == weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,weight);

@override
String toString() {
  return 'GradeValue(value: $value, weight: $weight)';
}


}

/// @nodoc
abstract mixin class _$GradeValueCopyWith<$Res> implements $GradeValueCopyWith<$Res> {
  factory _$GradeValueCopyWith(_GradeValue value, $Res Function(_GradeValue) _then) = __$GradeValueCopyWithImpl;
@override @useResult
$Res call({
 String value, double weight
});




}
/// @nodoc
class __$GradeValueCopyWithImpl<$Res>
    implements _$GradeValueCopyWith<$Res> {
  __$GradeValueCopyWithImpl(this._self, this._then);

  final _GradeValue _self;
  final $Res Function(_GradeValue) _then;

/// Create a copy of GradeValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? weight = null,}) {
  return _then(_GradeValue(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on

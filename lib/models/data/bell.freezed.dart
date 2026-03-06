// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bell.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Bell {

 String get id; int get weekday;@TimeOfDayConverter() TimeOfDay get start;@TimeOfDayConverter() TimeOfDay get end;
/// Create a copy of Bell
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BellCopyWith<Bell> get copyWith => _$BellCopyWithImpl<Bell>(this as Bell, _$identity);

  /// Serializes this Bell to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bell&&(identical(other.id, id) || other.id == id)&&(identical(other.weekday, weekday) || other.weekday == weekday)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,weekday,start,end);

@override
String toString() {
  return 'Bell(id: $id, weekday: $weekday, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $BellCopyWith<$Res>  {
  factory $BellCopyWith(Bell value, $Res Function(Bell) _then) = _$BellCopyWithImpl;
@useResult
$Res call({
 String id, int weekday,@TimeOfDayConverter() TimeOfDay start,@TimeOfDayConverter() TimeOfDay end
});




}
/// @nodoc
class _$BellCopyWithImpl<$Res>
    implements $BellCopyWith<$Res> {
  _$BellCopyWithImpl(this._self, this._then);

  final Bell _self;
  final $Res Function(Bell) _then;

/// Create a copy of Bell
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? weekday = null,Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,weekday: null == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as int,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as TimeOfDay,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as TimeOfDay,
  ));
}

}


/// Adds pattern-matching-related methods to [Bell].
extension BellPatterns on Bell {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Bell value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Bell() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Bell value)  $default,){
final _that = this;
switch (_that) {
case _Bell():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Bell value)?  $default,){
final _that = this;
switch (_that) {
case _Bell() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int weekday, @TimeOfDayConverter()  TimeOfDay start, @TimeOfDayConverter()  TimeOfDay end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bell() when $default != null:
return $default(_that.id,_that.weekday,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int weekday, @TimeOfDayConverter()  TimeOfDay start, @TimeOfDayConverter()  TimeOfDay end)  $default,) {final _that = this;
switch (_that) {
case _Bell():
return $default(_that.id,_that.weekday,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int weekday, @TimeOfDayConverter()  TimeOfDay start, @TimeOfDayConverter()  TimeOfDay end)?  $default,) {final _that = this;
switch (_that) {
case _Bell() when $default != null:
return $default(_that.id,_that.weekday,_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Bell extends Bell {
  const _Bell({required this.id, required this.weekday, @TimeOfDayConverter() required this.start, @TimeOfDayConverter() required this.end}): super._();
  factory _Bell.fromJson(Map<String, dynamic> json) => _$BellFromJson(json);

@override final  String id;
@override final  int weekday;
@override@TimeOfDayConverter() final  TimeOfDay start;
@override@TimeOfDayConverter() final  TimeOfDay end;

/// Create a copy of Bell
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BellCopyWith<_Bell> get copyWith => __$BellCopyWithImpl<_Bell>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BellToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bell&&(identical(other.id, id) || other.id == id)&&(identical(other.weekday, weekday) || other.weekday == weekday)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,weekday,start,end);

@override
String toString() {
  return 'Bell(id: $id, weekday: $weekday, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$BellCopyWith<$Res> implements $BellCopyWith<$Res> {
  factory _$BellCopyWith(_Bell value, $Res Function(_Bell) _then) = __$BellCopyWithImpl;
@override @useResult
$Res call({
 String id, int weekday,@TimeOfDayConverter() TimeOfDay start,@TimeOfDayConverter() TimeOfDay end
});




}
/// @nodoc
class __$BellCopyWithImpl<$Res>
    implements _$BellCopyWith<$Res> {
  __$BellCopyWithImpl(this._self, this._then);

  final _Bell _self;
  final $Res Function(_Bell) _then;

/// Create a copy of Bell
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? weekday = null,Object? start = null,Object? end = null,}) {
  return _then(_Bell(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,weekday: null == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as int,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as TimeOfDay,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as TimeOfDay,
  ));
}


}

// dart format on

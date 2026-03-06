// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'focus_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FocusTask implements DiagnosticableTreeMixin {

 DateTime get time; LessonMode? get mode;
/// Create a copy of FocusTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FocusTaskCopyWith<FocusTask> get copyWith => _$FocusTaskCopyWithImpl<FocusTask>(this as FocusTask, _$identity);

  /// Serializes this FocusTask to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FocusTask'))
    ..add(DiagnosticsProperty('time', time))..add(DiagnosticsProperty('mode', mode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FocusTask&&(identical(other.time, time) || other.time == time)&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,mode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FocusTask(time: $time, mode: $mode)';
}


}

/// @nodoc
abstract mixin class $FocusTaskCopyWith<$Res>  {
  factory $FocusTaskCopyWith(FocusTask value, $Res Function(FocusTask) _then) = _$FocusTaskCopyWithImpl;
@useResult
$Res call({
 DateTime time, LessonMode? mode
});




}
/// @nodoc
class _$FocusTaskCopyWithImpl<$Res>
    implements $FocusTaskCopyWith<$Res> {
  _$FocusTaskCopyWithImpl(this._self, this._then);

  final FocusTask _self;
  final $Res Function(FocusTask) _then;

/// Create a copy of FocusTask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? mode = freezed,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as LessonMode?,
  ));
}

}


/// Adds pattern-matching-related methods to [FocusTask].
extension FocusTaskPatterns on FocusTask {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FocusTask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FocusTask() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FocusTask value)  $default,){
final _that = this;
switch (_that) {
case _FocusTask():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FocusTask value)?  $default,){
final _that = this;
switch (_that) {
case _FocusTask() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime time,  LessonMode? mode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FocusTask() when $default != null:
return $default(_that.time,_that.mode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime time,  LessonMode? mode)  $default,) {final _that = this;
switch (_that) {
case _FocusTask():
return $default(_that.time,_that.mode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime time,  LessonMode? mode)?  $default,) {final _that = this;
switch (_that) {
case _FocusTask() when $default != null:
return $default(_that.time,_that.mode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FocusTask extends FocusTask with DiagnosticableTreeMixin {
  const _FocusTask({required this.time, required this.mode}): super._();
  factory _FocusTask.fromJson(Map<String, dynamic> json) => _$FocusTaskFromJson(json);

@override final  DateTime time;
@override final  LessonMode? mode;

/// Create a copy of FocusTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FocusTaskCopyWith<_FocusTask> get copyWith => __$FocusTaskCopyWithImpl<_FocusTask>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FocusTaskToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FocusTask'))
    ..add(DiagnosticsProperty('time', time))..add(DiagnosticsProperty('mode', mode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FocusTask&&(identical(other.time, time) || other.time == time)&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,mode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FocusTask(time: $time, mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$FocusTaskCopyWith<$Res> implements $FocusTaskCopyWith<$Res> {
  factory _$FocusTaskCopyWith(_FocusTask value, $Res Function(_FocusTask) _then) = __$FocusTaskCopyWithImpl;
@override @useResult
$Res call({
 DateTime time, LessonMode? mode
});




}
/// @nodoc
class __$FocusTaskCopyWithImpl<$Res>
    implements _$FocusTaskCopyWith<$Res> {
  __$FocusTaskCopyWithImpl(this._self, this._then);

  final _FocusTask _self;
  final $Res Function(_FocusTask) _then;

/// Create a copy of FocusTask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? mode = freezed,}) {
  return _then(_FocusTask(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as LessonMode?,
  ));
}


}

// dart format on

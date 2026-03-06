// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReminderTask implements DiagnosticableTreeMixin {

 DateTime get time; String get title; String? get body;
/// Create a copy of ReminderTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderTaskCopyWith<ReminderTask> get copyWith => _$ReminderTaskCopyWithImpl<ReminderTask>(this as ReminderTask, _$identity);

  /// Serializes this ReminderTask to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReminderTask'))
    ..add(DiagnosticsProperty('time', time))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('body', body));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderTask&&(identical(other.time, time) || other.time == time)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,title,body);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReminderTask(time: $time, title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class $ReminderTaskCopyWith<$Res>  {
  factory $ReminderTaskCopyWith(ReminderTask value, $Res Function(ReminderTask) _then) = _$ReminderTaskCopyWithImpl;
@useResult
$Res call({
 DateTime time, String title, String? body
});




}
/// @nodoc
class _$ReminderTaskCopyWithImpl<$Res>
    implements $ReminderTaskCopyWith<$Res> {
  _$ReminderTaskCopyWithImpl(this._self, this._then);

  final ReminderTask _self;
  final $Res Function(ReminderTask) _then;

/// Create a copy of ReminderTask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? title = null,Object? body = freezed,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReminderTask].
extension ReminderTaskPatterns on ReminderTask {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReminderTask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReminderTask() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReminderTask value)  $default,){
final _that = this;
switch (_that) {
case _ReminderTask():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReminderTask value)?  $default,){
final _that = this;
switch (_that) {
case _ReminderTask() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime time,  String title,  String? body)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReminderTask() when $default != null:
return $default(_that.time,_that.title,_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime time,  String title,  String? body)  $default,) {final _that = this;
switch (_that) {
case _ReminderTask():
return $default(_that.time,_that.title,_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime time,  String title,  String? body)?  $default,) {final _that = this;
switch (_that) {
case _ReminderTask() when $default != null:
return $default(_that.time,_that.title,_that.body);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReminderTask extends ReminderTask with DiagnosticableTreeMixin {
  const _ReminderTask({required this.time, required this.title, required this.body}): super._();
  factory _ReminderTask.fromJson(Map<String, dynamic> json) => _$ReminderTaskFromJson(json);

@override final  DateTime time;
@override final  String title;
@override final  String? body;

/// Create a copy of ReminderTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderTaskCopyWith<_ReminderTask> get copyWith => __$ReminderTaskCopyWithImpl<_ReminderTask>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReminderTaskToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReminderTask'))
    ..add(DiagnosticsProperty('time', time))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('body', body));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReminderTask&&(identical(other.time, time) || other.time == time)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,title,body);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReminderTask(time: $time, title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class _$ReminderTaskCopyWith<$Res> implements $ReminderTaskCopyWith<$Res> {
  factory _$ReminderTaskCopyWith(_ReminderTask value, $Res Function(_ReminderTask) _then) = __$ReminderTaskCopyWithImpl;
@override @useResult
$Res call({
 DateTime time, String title, String? body
});




}
/// @nodoc
class __$ReminderTaskCopyWithImpl<$Res>
    implements _$ReminderTaskCopyWith<$Res> {
  __$ReminderTaskCopyWithImpl(this._self, this._then);

  final _ReminderTask _self;
  final $Res Function(_ReminderTask) _then;

/// Create a copy of ReminderTask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? title = null,Object? body = freezed,}) {
  return _then(_ReminderTask(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

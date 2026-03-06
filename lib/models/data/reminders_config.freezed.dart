// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminders_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemindersConfig {

 EnabledValue<ReminderTime> get lessonStart;@TimeOfDayConverter() EnabledValue<TimeOfDay> get upcomingAssignments;
/// Create a copy of RemindersConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemindersConfigCopyWith<RemindersConfig> get copyWith => _$RemindersConfigCopyWithImpl<RemindersConfig>(this as RemindersConfig, _$identity);

  /// Serializes this RemindersConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemindersConfig&&(identical(other.lessonStart, lessonStart) || other.lessonStart == lessonStart)&&(identical(other.upcomingAssignments, upcomingAssignments) || other.upcomingAssignments == upcomingAssignments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lessonStart,upcomingAssignments);

@override
String toString() {
  return 'RemindersConfig(lessonStart: $lessonStart, upcomingAssignments: $upcomingAssignments)';
}


}

/// @nodoc
abstract mixin class $RemindersConfigCopyWith<$Res>  {
  factory $RemindersConfigCopyWith(RemindersConfig value, $Res Function(RemindersConfig) _then) = _$RemindersConfigCopyWithImpl;
@useResult
$Res call({
 EnabledValue<ReminderTime> lessonStart,@TimeOfDayConverter() EnabledValue<TimeOfDay> upcomingAssignments
});




}
/// @nodoc
class _$RemindersConfigCopyWithImpl<$Res>
    implements $RemindersConfigCopyWith<$Res> {
  _$RemindersConfigCopyWithImpl(this._self, this._then);

  final RemindersConfig _self;
  final $Res Function(RemindersConfig) _then;

/// Create a copy of RemindersConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lessonStart = null,Object? upcomingAssignments = null,}) {
  return _then(_self.copyWith(
lessonStart: null == lessonStart ? _self.lessonStart : lessonStart // ignore: cast_nullable_to_non_nullable
as EnabledValue<ReminderTime>,upcomingAssignments: null == upcomingAssignments ? _self.upcomingAssignments : upcomingAssignments // ignore: cast_nullable_to_non_nullable
as EnabledValue<TimeOfDay>,
  ));
}

}


/// Adds pattern-matching-related methods to [RemindersConfig].
extension RemindersConfigPatterns on RemindersConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemindersConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemindersConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemindersConfig value)  $default,){
final _that = this;
switch (_that) {
case _RemindersConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemindersConfig value)?  $default,){
final _that = this;
switch (_that) {
case _RemindersConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EnabledValue<ReminderTime> lessonStart, @TimeOfDayConverter()  EnabledValue<TimeOfDay> upcomingAssignments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemindersConfig() when $default != null:
return $default(_that.lessonStart,_that.upcomingAssignments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EnabledValue<ReminderTime> lessonStart, @TimeOfDayConverter()  EnabledValue<TimeOfDay> upcomingAssignments)  $default,) {final _that = this;
switch (_that) {
case _RemindersConfig():
return $default(_that.lessonStart,_that.upcomingAssignments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EnabledValue<ReminderTime> lessonStart, @TimeOfDayConverter()  EnabledValue<TimeOfDay> upcomingAssignments)?  $default,) {final _that = this;
switch (_that) {
case _RemindersConfig() when $default != null:
return $default(_that.lessonStart,_that.upcomingAssignments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RemindersConfig extends RemindersConfig {
  const _RemindersConfig({required this.lessonStart, @TimeOfDayConverter() required this.upcomingAssignments}): super._();
  factory _RemindersConfig.fromJson(Map<String, dynamic> json) => _$RemindersConfigFromJson(json);

@override final  EnabledValue<ReminderTime> lessonStart;
@override@TimeOfDayConverter() final  EnabledValue<TimeOfDay> upcomingAssignments;

/// Create a copy of RemindersConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemindersConfigCopyWith<_RemindersConfig> get copyWith => __$RemindersConfigCopyWithImpl<_RemindersConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemindersConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemindersConfig&&(identical(other.lessonStart, lessonStart) || other.lessonStart == lessonStart)&&(identical(other.upcomingAssignments, upcomingAssignments) || other.upcomingAssignments == upcomingAssignments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lessonStart,upcomingAssignments);

@override
String toString() {
  return 'RemindersConfig(lessonStart: $lessonStart, upcomingAssignments: $upcomingAssignments)';
}


}

/// @nodoc
abstract mixin class _$RemindersConfigCopyWith<$Res> implements $RemindersConfigCopyWith<$Res> {
  factory _$RemindersConfigCopyWith(_RemindersConfig value, $Res Function(_RemindersConfig) _then) = __$RemindersConfigCopyWithImpl;
@override @useResult
$Res call({
 EnabledValue<ReminderTime> lessonStart,@TimeOfDayConverter() EnabledValue<TimeOfDay> upcomingAssignments
});




}
/// @nodoc
class __$RemindersConfigCopyWithImpl<$Res>
    implements _$RemindersConfigCopyWith<$Res> {
  __$RemindersConfigCopyWithImpl(this._self, this._then);

  final _RemindersConfig _self;
  final $Res Function(_RemindersConfig) _then;

/// Create a copy of RemindersConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lessonStart = null,Object? upcomingAssignments = null,}) {
  return _then(_RemindersConfig(
lessonStart: null == lessonStart ? _self.lessonStart : lessonStart // ignore: cast_nullable_to_non_nullable
as EnabledValue<ReminderTime>,upcomingAssignments: null == upcomingAssignments ? _self.upcomingAssignments : upcomingAssignments // ignore: cast_nullable_to_non_nullable
as EnabledValue<TimeOfDay>,
  ));
}


}

// dart format on

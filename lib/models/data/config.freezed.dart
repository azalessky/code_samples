// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Config {

 String get id; GeneralConfig get general; AdvancedConfig get advanced; RemindersConfig get reminders; ScheduleConfig get schedule; GradesConfig get grades;
/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigCopyWith<Config> get copyWith => _$ConfigCopyWithImpl<Config>(this as Config, _$identity);

  /// Serializes this Config to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Config&&(identical(other.id, id) || other.id == id)&&(identical(other.general, general) || other.general == general)&&(identical(other.advanced, advanced) || other.advanced == advanced)&&(identical(other.reminders, reminders) || other.reminders == reminders)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.grades, grades) || other.grades == grades));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,general,advanced,reminders,schedule,grades);

@override
String toString() {
  return 'Config(id: $id, general: $general, advanced: $advanced, reminders: $reminders, schedule: $schedule, grades: $grades)';
}


}

/// @nodoc
abstract mixin class $ConfigCopyWith<$Res>  {
  factory $ConfigCopyWith(Config value, $Res Function(Config) _then) = _$ConfigCopyWithImpl;
@useResult
$Res call({
 String id, GeneralConfig general, AdvancedConfig advanced, RemindersConfig reminders, ScheduleConfig schedule, GradesConfig grades
});


$GeneralConfigCopyWith<$Res> get general;$AdvancedConfigCopyWith<$Res> get advanced;$RemindersConfigCopyWith<$Res> get reminders;$ScheduleConfigCopyWith<$Res> get schedule;$GradesConfigCopyWith<$Res> get grades;

}
/// @nodoc
class _$ConfigCopyWithImpl<$Res>
    implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._self, this._then);

  final Config _self;
  final $Res Function(Config) _then;

/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? general = null,Object? advanced = null,Object? reminders = null,Object? schedule = null,Object? grades = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,general: null == general ? _self.general : general // ignore: cast_nullable_to_non_nullable
as GeneralConfig,advanced: null == advanced ? _self.advanced : advanced // ignore: cast_nullable_to_non_nullable
as AdvancedConfig,reminders: null == reminders ? _self.reminders : reminders // ignore: cast_nullable_to_non_nullable
as RemindersConfig,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as ScheduleConfig,grades: null == grades ? _self.grades : grades // ignore: cast_nullable_to_non_nullable
as GradesConfig,
  ));
}
/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeneralConfigCopyWith<$Res> get general {
  
  return $GeneralConfigCopyWith<$Res>(_self.general, (value) {
    return _then(_self.copyWith(general: value));
  });
}/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdvancedConfigCopyWith<$Res> get advanced {
  
  return $AdvancedConfigCopyWith<$Res>(_self.advanced, (value) {
    return _then(_self.copyWith(advanced: value));
  });
}/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemindersConfigCopyWith<$Res> get reminders {
  
  return $RemindersConfigCopyWith<$Res>(_self.reminders, (value) {
    return _then(_self.copyWith(reminders: value));
  });
}/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScheduleConfigCopyWith<$Res> get schedule {
  
  return $ScheduleConfigCopyWith<$Res>(_self.schedule, (value) {
    return _then(_self.copyWith(schedule: value));
  });
}/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GradesConfigCopyWith<$Res> get grades {
  
  return $GradesConfigCopyWith<$Res>(_self.grades, (value) {
    return _then(_self.copyWith(grades: value));
  });
}
}


/// Adds pattern-matching-related methods to [Config].
extension ConfigPatterns on Config {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Config value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Config() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Config value)  $default,){
final _that = this;
switch (_that) {
case _Config():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Config value)?  $default,){
final _that = this;
switch (_that) {
case _Config() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  GeneralConfig general,  AdvancedConfig advanced,  RemindersConfig reminders,  ScheduleConfig schedule,  GradesConfig grades)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Config() when $default != null:
return $default(_that.id,_that.general,_that.advanced,_that.reminders,_that.schedule,_that.grades);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  GeneralConfig general,  AdvancedConfig advanced,  RemindersConfig reminders,  ScheduleConfig schedule,  GradesConfig grades)  $default,) {final _that = this;
switch (_that) {
case _Config():
return $default(_that.id,_that.general,_that.advanced,_that.reminders,_that.schedule,_that.grades);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  GeneralConfig general,  AdvancedConfig advanced,  RemindersConfig reminders,  ScheduleConfig schedule,  GradesConfig grades)?  $default,) {final _that = this;
switch (_that) {
case _Config() when $default != null:
return $default(_that.id,_that.general,_that.advanced,_that.reminders,_that.schedule,_that.grades);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Config implements Config {
  const _Config({required this.id, required this.general, required this.advanced, required this.reminders, required this.schedule, required this.grades});
  factory _Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

@override final  String id;
@override final  GeneralConfig general;
@override final  AdvancedConfig advanced;
@override final  RemindersConfig reminders;
@override final  ScheduleConfig schedule;
@override final  GradesConfig grades;

/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfigCopyWith<_Config> get copyWith => __$ConfigCopyWithImpl<_Config>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Config&&(identical(other.id, id) || other.id == id)&&(identical(other.general, general) || other.general == general)&&(identical(other.advanced, advanced) || other.advanced == advanced)&&(identical(other.reminders, reminders) || other.reminders == reminders)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.grades, grades) || other.grades == grades));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,general,advanced,reminders,schedule,grades);

@override
String toString() {
  return 'Config(id: $id, general: $general, advanced: $advanced, reminders: $reminders, schedule: $schedule, grades: $grades)';
}


}

/// @nodoc
abstract mixin class _$ConfigCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$ConfigCopyWith(_Config value, $Res Function(_Config) _then) = __$ConfigCopyWithImpl;
@override @useResult
$Res call({
 String id, GeneralConfig general, AdvancedConfig advanced, RemindersConfig reminders, ScheduleConfig schedule, GradesConfig grades
});


@override $GeneralConfigCopyWith<$Res> get general;@override $AdvancedConfigCopyWith<$Res> get advanced;@override $RemindersConfigCopyWith<$Res> get reminders;@override $ScheduleConfigCopyWith<$Res> get schedule;@override $GradesConfigCopyWith<$Res> get grades;

}
/// @nodoc
class __$ConfigCopyWithImpl<$Res>
    implements _$ConfigCopyWith<$Res> {
  __$ConfigCopyWithImpl(this._self, this._then);

  final _Config _self;
  final $Res Function(_Config) _then;

/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? general = null,Object? advanced = null,Object? reminders = null,Object? schedule = null,Object? grades = null,}) {
  return _then(_Config(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,general: null == general ? _self.general : general // ignore: cast_nullable_to_non_nullable
as GeneralConfig,advanced: null == advanced ? _self.advanced : advanced // ignore: cast_nullable_to_non_nullable
as AdvancedConfig,reminders: null == reminders ? _self.reminders : reminders // ignore: cast_nullable_to_non_nullable
as RemindersConfig,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as ScheduleConfig,grades: null == grades ? _self.grades : grades // ignore: cast_nullable_to_non_nullable
as GradesConfig,
  ));
}

/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeneralConfigCopyWith<$Res> get general {
  
  return $GeneralConfigCopyWith<$Res>(_self.general, (value) {
    return _then(_self.copyWith(general: value));
  });
}/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdvancedConfigCopyWith<$Res> get advanced {
  
  return $AdvancedConfigCopyWith<$Res>(_self.advanced, (value) {
    return _then(_self.copyWith(advanced: value));
  });
}/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemindersConfigCopyWith<$Res> get reminders {
  
  return $RemindersConfigCopyWith<$Res>(_self.reminders, (value) {
    return _then(_self.copyWith(reminders: value));
  });
}/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScheduleConfigCopyWith<$Res> get schedule {
  
  return $ScheduleConfigCopyWith<$Res>(_self.schedule, (value) {
    return _then(_self.copyWith(schedule: value));
  });
}/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GradesConfigCopyWith<$Res> get grades {
  
  return $GradesConfigCopyWith<$Res>(_self.grades, (value) {
    return _then(_self.copyWith(grades: value));
  });
}
}

// dart format on

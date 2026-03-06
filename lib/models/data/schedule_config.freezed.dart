// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScheduleConfig {

 AcademicTerm get academicTerm; List<int> get classDays; int get periodCount; RepeatSchedule get repeatSchedule; BellSchedule get bellSchedule;
/// Create a copy of ScheduleConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleConfigCopyWith<ScheduleConfig> get copyWith => _$ScheduleConfigCopyWithImpl<ScheduleConfig>(this as ScheduleConfig, _$identity);

  /// Serializes this ScheduleConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleConfig&&(identical(other.academicTerm, academicTerm) || other.academicTerm == academicTerm)&&const DeepCollectionEquality().equals(other.classDays, classDays)&&(identical(other.periodCount, periodCount) || other.periodCount == periodCount)&&(identical(other.repeatSchedule, repeatSchedule) || other.repeatSchedule == repeatSchedule)&&(identical(other.bellSchedule, bellSchedule) || other.bellSchedule == bellSchedule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,academicTerm,const DeepCollectionEquality().hash(classDays),periodCount,repeatSchedule,bellSchedule);

@override
String toString() {
  return 'ScheduleConfig(academicTerm: $academicTerm, classDays: $classDays, periodCount: $periodCount, repeatSchedule: $repeatSchedule, bellSchedule: $bellSchedule)';
}


}

/// @nodoc
abstract mixin class $ScheduleConfigCopyWith<$Res>  {
  factory $ScheduleConfigCopyWith(ScheduleConfig value, $Res Function(ScheduleConfig) _then) = _$ScheduleConfigCopyWithImpl;
@useResult
$Res call({
 AcademicTerm academicTerm, List<int> classDays, int periodCount, RepeatSchedule repeatSchedule, BellSchedule bellSchedule
});




}
/// @nodoc
class _$ScheduleConfigCopyWithImpl<$Res>
    implements $ScheduleConfigCopyWith<$Res> {
  _$ScheduleConfigCopyWithImpl(this._self, this._then);

  final ScheduleConfig _self;
  final $Res Function(ScheduleConfig) _then;

/// Create a copy of ScheduleConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? academicTerm = null,Object? classDays = null,Object? periodCount = null,Object? repeatSchedule = null,Object? bellSchedule = null,}) {
  return _then(_self.copyWith(
academicTerm: null == academicTerm ? _self.academicTerm : academicTerm // ignore: cast_nullable_to_non_nullable
as AcademicTerm,classDays: null == classDays ? _self.classDays : classDays // ignore: cast_nullable_to_non_nullable
as List<int>,periodCount: null == periodCount ? _self.periodCount : periodCount // ignore: cast_nullable_to_non_nullable
as int,repeatSchedule: null == repeatSchedule ? _self.repeatSchedule : repeatSchedule // ignore: cast_nullable_to_non_nullable
as RepeatSchedule,bellSchedule: null == bellSchedule ? _self.bellSchedule : bellSchedule // ignore: cast_nullable_to_non_nullable
as BellSchedule,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleConfig].
extension ScheduleConfigPatterns on ScheduleConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleConfig value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AcademicTerm academicTerm,  List<int> classDays,  int periodCount,  RepeatSchedule repeatSchedule,  BellSchedule bellSchedule)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleConfig() when $default != null:
return $default(_that.academicTerm,_that.classDays,_that.periodCount,_that.repeatSchedule,_that.bellSchedule);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AcademicTerm academicTerm,  List<int> classDays,  int periodCount,  RepeatSchedule repeatSchedule,  BellSchedule bellSchedule)  $default,) {final _that = this;
switch (_that) {
case _ScheduleConfig():
return $default(_that.academicTerm,_that.classDays,_that.periodCount,_that.repeatSchedule,_that.bellSchedule);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AcademicTerm academicTerm,  List<int> classDays,  int periodCount,  RepeatSchedule repeatSchedule,  BellSchedule bellSchedule)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleConfig() when $default != null:
return $default(_that.academicTerm,_that.classDays,_that.periodCount,_that.repeatSchedule,_that.bellSchedule);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScheduleConfig implements ScheduleConfig {
  const _ScheduleConfig({required this.academicTerm, required final  List<int> classDays, required this.periodCount, required this.repeatSchedule, required this.bellSchedule}): _classDays = classDays;
  factory _ScheduleConfig.fromJson(Map<String, dynamic> json) => _$ScheduleConfigFromJson(json);

@override final  AcademicTerm academicTerm;
 final  List<int> _classDays;
@override List<int> get classDays {
  if (_classDays is EqualUnmodifiableListView) return _classDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_classDays);
}

@override final  int periodCount;
@override final  RepeatSchedule repeatSchedule;
@override final  BellSchedule bellSchedule;

/// Create a copy of ScheduleConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleConfigCopyWith<_ScheduleConfig> get copyWith => __$ScheduleConfigCopyWithImpl<_ScheduleConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScheduleConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleConfig&&(identical(other.academicTerm, academicTerm) || other.academicTerm == academicTerm)&&const DeepCollectionEquality().equals(other._classDays, _classDays)&&(identical(other.periodCount, periodCount) || other.periodCount == periodCount)&&(identical(other.repeatSchedule, repeatSchedule) || other.repeatSchedule == repeatSchedule)&&(identical(other.bellSchedule, bellSchedule) || other.bellSchedule == bellSchedule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,academicTerm,const DeepCollectionEquality().hash(_classDays),periodCount,repeatSchedule,bellSchedule);

@override
String toString() {
  return 'ScheduleConfig(academicTerm: $academicTerm, classDays: $classDays, periodCount: $periodCount, repeatSchedule: $repeatSchedule, bellSchedule: $bellSchedule)';
}


}

/// @nodoc
abstract mixin class _$ScheduleConfigCopyWith<$Res> implements $ScheduleConfigCopyWith<$Res> {
  factory _$ScheduleConfigCopyWith(_ScheduleConfig value, $Res Function(_ScheduleConfig) _then) = __$ScheduleConfigCopyWithImpl;
@override @useResult
$Res call({
 AcademicTerm academicTerm, List<int> classDays, int periodCount, RepeatSchedule repeatSchedule, BellSchedule bellSchedule
});




}
/// @nodoc
class __$ScheduleConfigCopyWithImpl<$Res>
    implements _$ScheduleConfigCopyWith<$Res> {
  __$ScheduleConfigCopyWithImpl(this._self, this._then);

  final _ScheduleConfig _self;
  final $Res Function(_ScheduleConfig) _then;

/// Create a copy of ScheduleConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? academicTerm = null,Object? classDays = null,Object? periodCount = null,Object? repeatSchedule = null,Object? bellSchedule = null,}) {
  return _then(_ScheduleConfig(
academicTerm: null == academicTerm ? _self.academicTerm : academicTerm // ignore: cast_nullable_to_non_nullable
as AcademicTerm,classDays: null == classDays ? _self._classDays : classDays // ignore: cast_nullable_to_non_nullable
as List<int>,periodCount: null == periodCount ? _self.periodCount : periodCount // ignore: cast_nullable_to_non_nullable
as int,repeatSchedule: null == repeatSchedule ? _self.repeatSchedule : repeatSchedule // ignore: cast_nullable_to_non_nullable
as RepeatSchedule,bellSchedule: null == bellSchedule ? _self.bellSchedule : bellSchedule // ignore: cast_nullable_to_non_nullable
as BellSchedule,
  ));
}


}

// dart format on

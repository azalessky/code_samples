// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grade.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Grade implements DiagnosticableTreeMixin {

 String get id; String get refId; GradeType get type; DateTime get date; String get subject; List<GradeValue> get values; String get attendance; String get comment;
/// Create a copy of Grade
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GradeCopyWith<Grade> get copyWith => _$GradeCopyWithImpl<Grade>(this as Grade, _$identity);

  /// Serializes this Grade to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Grade'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('refId', refId))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('date', date))..add(DiagnosticsProperty('subject', subject))..add(DiagnosticsProperty('values', values))..add(DiagnosticsProperty('attendance', attendance))..add(DiagnosticsProperty('comment', comment));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Grade&&(identical(other.id, id) || other.id == id)&&(identical(other.refId, refId) || other.refId == refId)&&(identical(other.type, type) || other.type == type)&&(identical(other.date, date) || other.date == date)&&(identical(other.subject, subject) || other.subject == subject)&&const DeepCollectionEquality().equals(other.values, values)&&(identical(other.attendance, attendance) || other.attendance == attendance)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,refId,type,date,subject,const DeepCollectionEquality().hash(values),attendance,comment);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Grade(id: $id, refId: $refId, type: $type, date: $date, subject: $subject, values: $values, attendance: $attendance, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $GradeCopyWith<$Res>  {
  factory $GradeCopyWith(Grade value, $Res Function(Grade) _then) = _$GradeCopyWithImpl;
@useResult
$Res call({
 String id, String refId, GradeType type, DateTime date, String subject, List<GradeValue> values, String attendance, String comment
});




}
/// @nodoc
class _$GradeCopyWithImpl<$Res>
    implements $GradeCopyWith<$Res> {
  _$GradeCopyWithImpl(this._self, this._then);

  final Grade _self;
  final $Res Function(Grade) _then;

/// Create a copy of Grade
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? refId = null,Object? type = null,Object? date = null,Object? subject = null,Object? values = null,Object? attendance = null,Object? comment = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,refId: null == refId ? _self.refId : refId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GradeType,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as List<GradeValue>,attendance: null == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Grade].
extension GradePatterns on Grade {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Grade value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Grade() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Grade value)  $default,){
final _that = this;
switch (_that) {
case _Grade():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Grade value)?  $default,){
final _that = this;
switch (_that) {
case _Grade() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String refId,  GradeType type,  DateTime date,  String subject,  List<GradeValue> values,  String attendance,  String comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Grade() when $default != null:
return $default(_that.id,_that.refId,_that.type,_that.date,_that.subject,_that.values,_that.attendance,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String refId,  GradeType type,  DateTime date,  String subject,  List<GradeValue> values,  String attendance,  String comment)  $default,) {final _that = this;
switch (_that) {
case _Grade():
return $default(_that.id,_that.refId,_that.type,_that.date,_that.subject,_that.values,_that.attendance,_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String refId,  GradeType type,  DateTime date,  String subject,  List<GradeValue> values,  String attendance,  String comment)?  $default,) {final _that = this;
switch (_that) {
case _Grade() when $default != null:
return $default(_that.id,_that.refId,_that.type,_that.date,_that.subject,_that.values,_that.attendance,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Grade extends Grade with DiagnosticableTreeMixin {
  const _Grade({required this.id, required this.refId, required this.type, required this.date, required this.subject, required final  List<GradeValue> values, required this.attendance, required this.comment}): _values = values,super._();
  factory _Grade.fromJson(Map<String, dynamic> json) => _$GradeFromJson(json);

@override final  String id;
@override final  String refId;
@override final  GradeType type;
@override final  DateTime date;
@override final  String subject;
 final  List<GradeValue> _values;
@override List<GradeValue> get values {
  if (_values is EqualUnmodifiableListView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_values);
}

@override final  String attendance;
@override final  String comment;

/// Create a copy of Grade
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GradeCopyWith<_Grade> get copyWith => __$GradeCopyWithImpl<_Grade>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GradeToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Grade'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('refId', refId))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('date', date))..add(DiagnosticsProperty('subject', subject))..add(DiagnosticsProperty('values', values))..add(DiagnosticsProperty('attendance', attendance))..add(DiagnosticsProperty('comment', comment));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Grade&&(identical(other.id, id) || other.id == id)&&(identical(other.refId, refId) || other.refId == refId)&&(identical(other.type, type) || other.type == type)&&(identical(other.date, date) || other.date == date)&&(identical(other.subject, subject) || other.subject == subject)&&const DeepCollectionEquality().equals(other._values, _values)&&(identical(other.attendance, attendance) || other.attendance == attendance)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,refId,type,date,subject,const DeepCollectionEquality().hash(_values),attendance,comment);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Grade(id: $id, refId: $refId, type: $type, date: $date, subject: $subject, values: $values, attendance: $attendance, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$GradeCopyWith<$Res> implements $GradeCopyWith<$Res> {
  factory _$GradeCopyWith(_Grade value, $Res Function(_Grade) _then) = __$GradeCopyWithImpl;
@override @useResult
$Res call({
 String id, String refId, GradeType type, DateTime date, String subject, List<GradeValue> values, String attendance, String comment
});




}
/// @nodoc
class __$GradeCopyWithImpl<$Res>
    implements _$GradeCopyWith<$Res> {
  __$GradeCopyWithImpl(this._self, this._then);

  final _Grade _self;
  final $Res Function(_Grade) _then;

/// Create a copy of Grade
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? refId = null,Object? type = null,Object? date = null,Object? subject = null,Object? values = null,Object? attendance = null,Object? comment = null,}) {
  return _then(_Grade(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,refId: null == refId ? _self.refId : refId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GradeType,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as List<GradeValue>,attendance: null == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

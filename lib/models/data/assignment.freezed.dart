// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Assignment implements DiagnosticableTreeMixin {

 String get id; String get refId; DateTime get date; String get subject; AssignmentContent get content; List<String> get labels; List<String> get images; bool get completed; bool get archived;
/// Create a copy of Assignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignmentCopyWith<Assignment> get copyWith => _$AssignmentCopyWithImpl<Assignment>(this as Assignment, _$identity);

  /// Serializes this Assignment to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Assignment'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('refId', refId))..add(DiagnosticsProperty('date', date))..add(DiagnosticsProperty('subject', subject))..add(DiagnosticsProperty('content', content))..add(DiagnosticsProperty('labels', labels))..add(DiagnosticsProperty('images', images))..add(DiagnosticsProperty('completed', completed))..add(DiagnosticsProperty('archived', archived));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Assignment&&(identical(other.id, id) || other.id == id)&&(identical(other.refId, refId) || other.refId == refId)&&(identical(other.date, date) || other.date == date)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.labels, labels)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.archived, archived) || other.archived == archived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,refId,date,subject,content,const DeepCollectionEquality().hash(labels),const DeepCollectionEquality().hash(images),completed,archived);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Assignment(id: $id, refId: $refId, date: $date, subject: $subject, content: $content, labels: $labels, images: $images, completed: $completed, archived: $archived)';
}


}

/// @nodoc
abstract mixin class $AssignmentCopyWith<$Res>  {
  factory $AssignmentCopyWith(Assignment value, $Res Function(Assignment) _then) = _$AssignmentCopyWithImpl;
@useResult
$Res call({
 String id, String refId, DateTime date, String subject, AssignmentContent content, List<String> labels, List<String> images, bool completed, bool archived
});


$AssignmentContentCopyWith<$Res> get content;

}
/// @nodoc
class _$AssignmentCopyWithImpl<$Res>
    implements $AssignmentCopyWith<$Res> {
  _$AssignmentCopyWithImpl(this._self, this._then);

  final Assignment _self;
  final $Res Function(Assignment) _then;

/// Create a copy of Assignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? refId = null,Object? date = null,Object? subject = null,Object? content = null,Object? labels = null,Object? images = null,Object? completed = null,Object? archived = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,refId: null == refId ? _self.refId : refId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as AssignmentContent,labels: null == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Assignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssignmentContentCopyWith<$Res> get content {
  
  return $AssignmentContentCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}


/// Adds pattern-matching-related methods to [Assignment].
extension AssignmentPatterns on Assignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Assignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Assignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Assignment value)  $default,){
final _that = this;
switch (_that) {
case _Assignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Assignment value)?  $default,){
final _that = this;
switch (_that) {
case _Assignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String refId,  DateTime date,  String subject,  AssignmentContent content,  List<String> labels,  List<String> images,  bool completed,  bool archived)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Assignment() when $default != null:
return $default(_that.id,_that.refId,_that.date,_that.subject,_that.content,_that.labels,_that.images,_that.completed,_that.archived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String refId,  DateTime date,  String subject,  AssignmentContent content,  List<String> labels,  List<String> images,  bool completed,  bool archived)  $default,) {final _that = this;
switch (_that) {
case _Assignment():
return $default(_that.id,_that.refId,_that.date,_that.subject,_that.content,_that.labels,_that.images,_that.completed,_that.archived);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String refId,  DateTime date,  String subject,  AssignmentContent content,  List<String> labels,  List<String> images,  bool completed,  bool archived)?  $default,) {final _that = this;
switch (_that) {
case _Assignment() when $default != null:
return $default(_that.id,_that.refId,_that.date,_that.subject,_that.content,_that.labels,_that.images,_that.completed,_that.archived);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Assignment extends Assignment with DiagnosticableTreeMixin {
  const _Assignment({required this.id, required this.refId, required this.date, required this.subject, required this.content, required final  List<String> labels, required final  List<String> images, required this.completed, required this.archived}): _labels = labels,_images = images,super._();
  factory _Assignment.fromJson(Map<String, dynamic> json) => _$AssignmentFromJson(json);

@override final  String id;
@override final  String refId;
@override final  DateTime date;
@override final  String subject;
@override final  AssignmentContent content;
 final  List<String> _labels;
@override List<String> get labels {
  if (_labels is EqualUnmodifiableListView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_labels);
}

 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  bool completed;
@override final  bool archived;

/// Create a copy of Assignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignmentCopyWith<_Assignment> get copyWith => __$AssignmentCopyWithImpl<_Assignment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignmentToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Assignment'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('refId', refId))..add(DiagnosticsProperty('date', date))..add(DiagnosticsProperty('subject', subject))..add(DiagnosticsProperty('content', content))..add(DiagnosticsProperty('labels', labels))..add(DiagnosticsProperty('images', images))..add(DiagnosticsProperty('completed', completed))..add(DiagnosticsProperty('archived', archived));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Assignment&&(identical(other.id, id) || other.id == id)&&(identical(other.refId, refId) || other.refId == refId)&&(identical(other.date, date) || other.date == date)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._labels, _labels)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.archived, archived) || other.archived == archived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,refId,date,subject,content,const DeepCollectionEquality().hash(_labels),const DeepCollectionEquality().hash(_images),completed,archived);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Assignment(id: $id, refId: $refId, date: $date, subject: $subject, content: $content, labels: $labels, images: $images, completed: $completed, archived: $archived)';
}


}

/// @nodoc
abstract mixin class _$AssignmentCopyWith<$Res> implements $AssignmentCopyWith<$Res> {
  factory _$AssignmentCopyWith(_Assignment value, $Res Function(_Assignment) _then) = __$AssignmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String refId, DateTime date, String subject, AssignmentContent content, List<String> labels, List<String> images, bool completed, bool archived
});


@override $AssignmentContentCopyWith<$Res> get content;

}
/// @nodoc
class __$AssignmentCopyWithImpl<$Res>
    implements _$AssignmentCopyWith<$Res> {
  __$AssignmentCopyWithImpl(this._self, this._then);

  final _Assignment _self;
  final $Res Function(_Assignment) _then;

/// Create a copy of Assignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? refId = null,Object? date = null,Object? subject = null,Object? content = null,Object? labels = null,Object? images = null,Object? completed = null,Object? archived = null,}) {
  return _then(_Assignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,refId: null == refId ? _self.refId : refId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as AssignmentContent,labels: null == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Assignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssignmentContentCopyWith<$Res> get content {
  
  return $AssignmentContentCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}

// dart format on

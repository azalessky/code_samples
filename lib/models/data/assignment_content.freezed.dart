// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assignment_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
AssignmentContent _$AssignmentContentFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'text':
          return TextContent.fromJson(
            json
          );
                case 'list':
          return ListContent.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'AssignmentContent',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$AssignmentContent {



  /// Serializes this AssignmentContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignmentContent);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AssignmentContent()';
}


}

/// @nodoc
class $AssignmentContentCopyWith<$Res>  {
$AssignmentContentCopyWith(AssignmentContent _, $Res Function(AssignmentContent) __);
}


/// Adds pattern-matching-related methods to [AssignmentContent].
extension AssignmentContentPatterns on AssignmentContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TextContent value)?  text,TResult Function( ListContent value)?  list,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TextContent() when text != null:
return text(_that);case ListContent() when list != null:
return list(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TextContent value)  text,required TResult Function( ListContent value)  list,}){
final _that = this;
switch (_that) {
case TextContent():
return text(_that);case ListContent():
return list(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TextContent value)?  text,TResult? Function( ListContent value)?  list,}){
final _that = this;
switch (_that) {
case TextContent() when text != null:
return text(_that);case ListContent() when list != null:
return list(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String text)?  text,TResult Function( List<CheckItem> items)?  list,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TextContent() when text != null:
return text(_that.text);case ListContent() when list != null:
return list(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String text)  text,required TResult Function( List<CheckItem> items)  list,}) {final _that = this;
switch (_that) {
case TextContent():
return text(_that.text);case ListContent():
return list(_that.items);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String text)?  text,TResult? Function( List<CheckItem> items)?  list,}) {final _that = this;
switch (_that) {
case TextContent() when text != null:
return text(_that.text);case ListContent() when list != null:
return list(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class TextContent extends AssignmentContent {
  const TextContent(this.text, {final  String? $type}): $type = $type ?? 'text',super._();
  factory TextContent.fromJson(Map<String, dynamic> json) => _$TextContentFromJson(json);

 final  String text;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of AssignmentContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextContentCopyWith<TextContent> get copyWith => _$TextContentCopyWithImpl<TextContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextContent&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'AssignmentContent.text(text: $text)';
}


}

/// @nodoc
abstract mixin class $TextContentCopyWith<$Res> implements $AssignmentContentCopyWith<$Res> {
  factory $TextContentCopyWith(TextContent value, $Res Function(TextContent) _then) = _$TextContentCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$TextContentCopyWithImpl<$Res>
    implements $TextContentCopyWith<$Res> {
  _$TextContentCopyWithImpl(this._self, this._then);

  final TextContent _self;
  final $Res Function(TextContent) _then;

/// Create a copy of AssignmentContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(TextContent(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ListContent extends AssignmentContent {
  const ListContent(final  List<CheckItem> items, {final  String? $type}): _items = items,$type = $type ?? 'list',super._();
  factory ListContent.fromJson(Map<String, dynamic> json) => _$ListContentFromJson(json);

 final  List<CheckItem> _items;
 List<CheckItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of AssignmentContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListContentCopyWith<ListContent> get copyWith => _$ListContentCopyWithImpl<ListContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListContent&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'AssignmentContent.list(items: $items)';
}


}

/// @nodoc
abstract mixin class $ListContentCopyWith<$Res> implements $AssignmentContentCopyWith<$Res> {
  factory $ListContentCopyWith(ListContent value, $Res Function(ListContent) _then) = _$ListContentCopyWithImpl;
@useResult
$Res call({
 List<CheckItem> items
});




}
/// @nodoc
class _$ListContentCopyWithImpl<$Res>
    implements $ListContentCopyWith<$Res> {
  _$ListContentCopyWithImpl(this._self, this._then);

  final ListContent _self;
  final $Res Function(ListContent) _then;

/// Create a copy of AssignmentContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(ListContent(
null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CheckItem>,
  ));
}


}

// dart format on

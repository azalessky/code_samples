// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeneralConfig {

 String get appLanguage; ThemeMode get themeMode;@ColorConverter() Color get baseColor; String get backgroundImage; String get appFont;
/// Create a copy of GeneralConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneralConfigCopyWith<GeneralConfig> get copyWith => _$GeneralConfigCopyWithImpl<GeneralConfig>(this as GeneralConfig, _$identity);

  /// Serializes this GeneralConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneralConfig&&(identical(other.appLanguage, appLanguage) || other.appLanguage == appLanguage)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.baseColor, baseColor) || other.baseColor == baseColor)&&(identical(other.backgroundImage, backgroundImage) || other.backgroundImage == backgroundImage)&&(identical(other.appFont, appFont) || other.appFont == appFont));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appLanguage,themeMode,baseColor,backgroundImage,appFont);

@override
String toString() {
  return 'GeneralConfig(appLanguage: $appLanguage, themeMode: $themeMode, baseColor: $baseColor, backgroundImage: $backgroundImage, appFont: $appFont)';
}


}

/// @nodoc
abstract mixin class $GeneralConfigCopyWith<$Res>  {
  factory $GeneralConfigCopyWith(GeneralConfig value, $Res Function(GeneralConfig) _then) = _$GeneralConfigCopyWithImpl;
@useResult
$Res call({
 String appLanguage, ThemeMode themeMode,@ColorConverter() Color baseColor, String backgroundImage, String appFont
});




}
/// @nodoc
class _$GeneralConfigCopyWithImpl<$Res>
    implements $GeneralConfigCopyWith<$Res> {
  _$GeneralConfigCopyWithImpl(this._self, this._then);

  final GeneralConfig _self;
  final $Res Function(GeneralConfig) _then;

/// Create a copy of GeneralConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appLanguage = null,Object? themeMode = null,Object? baseColor = null,Object? backgroundImage = null,Object? appFont = null,}) {
  return _then(_self.copyWith(
appLanguage: null == appLanguage ? _self.appLanguage : appLanguage // ignore: cast_nullable_to_non_nullable
as String,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,baseColor: null == baseColor ? _self.baseColor : baseColor // ignore: cast_nullable_to_non_nullable
as Color,backgroundImage: null == backgroundImage ? _self.backgroundImage : backgroundImage // ignore: cast_nullable_to_non_nullable
as String,appFont: null == appFont ? _self.appFont : appFont // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GeneralConfig].
extension GeneralConfigPatterns on GeneralConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeneralConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeneralConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeneralConfig value)  $default,){
final _that = this;
switch (_that) {
case _GeneralConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeneralConfig value)?  $default,){
final _that = this;
switch (_that) {
case _GeneralConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String appLanguage,  ThemeMode themeMode, @ColorConverter()  Color baseColor,  String backgroundImage,  String appFont)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeneralConfig() when $default != null:
return $default(_that.appLanguage,_that.themeMode,_that.baseColor,_that.backgroundImage,_that.appFont);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String appLanguage,  ThemeMode themeMode, @ColorConverter()  Color baseColor,  String backgroundImage,  String appFont)  $default,) {final _that = this;
switch (_that) {
case _GeneralConfig():
return $default(_that.appLanguage,_that.themeMode,_that.baseColor,_that.backgroundImage,_that.appFont);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String appLanguage,  ThemeMode themeMode, @ColorConverter()  Color baseColor,  String backgroundImage,  String appFont)?  $default,) {final _that = this;
switch (_that) {
case _GeneralConfig() when $default != null:
return $default(_that.appLanguage,_that.themeMode,_that.baseColor,_that.backgroundImage,_that.appFont);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeneralConfig implements GeneralConfig {
  const _GeneralConfig({required this.appLanguage, required this.themeMode, @ColorConverter() required this.baseColor, required this.backgroundImage, required this.appFont});
  factory _GeneralConfig.fromJson(Map<String, dynamic> json) => _$GeneralConfigFromJson(json);

@override final  String appLanguage;
@override final  ThemeMode themeMode;
@override@ColorConverter() final  Color baseColor;
@override final  String backgroundImage;
@override final  String appFont;

/// Create a copy of GeneralConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneralConfigCopyWith<_GeneralConfig> get copyWith => __$GeneralConfigCopyWithImpl<_GeneralConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeneralConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneralConfig&&(identical(other.appLanguage, appLanguage) || other.appLanguage == appLanguage)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.baseColor, baseColor) || other.baseColor == baseColor)&&(identical(other.backgroundImage, backgroundImage) || other.backgroundImage == backgroundImage)&&(identical(other.appFont, appFont) || other.appFont == appFont));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appLanguage,themeMode,baseColor,backgroundImage,appFont);

@override
String toString() {
  return 'GeneralConfig(appLanguage: $appLanguage, themeMode: $themeMode, baseColor: $baseColor, backgroundImage: $backgroundImage, appFont: $appFont)';
}


}

/// @nodoc
abstract mixin class _$GeneralConfigCopyWith<$Res> implements $GeneralConfigCopyWith<$Res> {
  factory _$GeneralConfigCopyWith(_GeneralConfig value, $Res Function(_GeneralConfig) _then) = __$GeneralConfigCopyWithImpl;
@override @useResult
$Res call({
 String appLanguage, ThemeMode themeMode,@ColorConverter() Color baseColor, String backgroundImage, String appFont
});




}
/// @nodoc
class __$GeneralConfigCopyWithImpl<$Res>
    implements _$GeneralConfigCopyWith<$Res> {
  __$GeneralConfigCopyWithImpl(this._self, this._then);

  final _GeneralConfig _self;
  final $Res Function(_GeneralConfig) _then;

/// Create a copy of GeneralConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appLanguage = null,Object? themeMode = null,Object? baseColor = null,Object? backgroundImage = null,Object? appFont = null,}) {
  return _then(_GeneralConfig(
appLanguage: null == appLanguage ? _self.appLanguage : appLanguage // ignore: cast_nullable_to_non_nullable
as String,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,baseColor: null == baseColor ? _self.baseColor : baseColor // ignore: cast_nullable_to_non_nullable
as Color,backgroundImage: null == backgroundImage ? _self.backgroundImage : backgroundImage // ignore: cast_nullable_to_non_nullable
as String,appFont: null == appFont ? _self.appFont : appFont // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

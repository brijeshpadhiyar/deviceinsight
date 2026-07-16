// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CameraInfo {

 String get id; String get facing; int get hardwareLevel;
/// Create a copy of CameraInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraInfoCopyWith<CameraInfo> get copyWith => _$CameraInfoCopyWithImpl<CameraInfo>(this as CameraInfo, _$identity);

  /// Serializes this CameraInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.facing, facing) || other.facing == facing)&&(identical(other.hardwareLevel, hardwareLevel) || other.hardwareLevel == hardwareLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,facing,hardwareLevel);

@override
String toString() {
  return 'CameraInfo(id: $id, facing: $facing, hardwareLevel: $hardwareLevel)';
}


}

/// @nodoc
abstract mixin class $CameraInfoCopyWith<$Res>  {
  factory $CameraInfoCopyWith(CameraInfo value, $Res Function(CameraInfo) _then) = _$CameraInfoCopyWithImpl;
@useResult
$Res call({
 String id, String facing, int hardwareLevel
});




}
/// @nodoc
class _$CameraInfoCopyWithImpl<$Res>
    implements $CameraInfoCopyWith<$Res> {
  _$CameraInfoCopyWithImpl(this._self, this._then);

  final CameraInfo _self;
  final $Res Function(CameraInfo) _then;

/// Create a copy of CameraInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? facing = null,Object? hardwareLevel = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,facing: null == facing ? _self.facing : facing // ignore: cast_nullable_to_non_nullable
as String,hardwareLevel: null == hardwareLevel ? _self.hardwareLevel : hardwareLevel // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CameraInfo].
extension CameraInfoPatterns on CameraInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CameraInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CameraInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CameraInfo value)  $default,){
final _that = this;
switch (_that) {
case _CameraInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CameraInfo value)?  $default,){
final _that = this;
switch (_that) {
case _CameraInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String facing,  int hardwareLevel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CameraInfo() when $default != null:
return $default(_that.id,_that.facing,_that.hardwareLevel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String facing,  int hardwareLevel)  $default,) {final _that = this;
switch (_that) {
case _CameraInfo():
return $default(_that.id,_that.facing,_that.hardwareLevel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String facing,  int hardwareLevel)?  $default,) {final _that = this;
switch (_that) {
case _CameraInfo() when $default != null:
return $default(_that.id,_that.facing,_that.hardwareLevel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CameraInfo implements CameraInfo {
  const _CameraInfo({this.id = 'Unknown', this.facing = 'Unknown', this.hardwareLevel = 0});
  factory _CameraInfo.fromJson(Map<String, dynamic> json) => _$CameraInfoFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String facing;
@override@JsonKey() final  int hardwareLevel;

/// Create a copy of CameraInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CameraInfoCopyWith<_CameraInfo> get copyWith => __$CameraInfoCopyWithImpl<_CameraInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CameraInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CameraInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.facing, facing) || other.facing == facing)&&(identical(other.hardwareLevel, hardwareLevel) || other.hardwareLevel == hardwareLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,facing,hardwareLevel);

@override
String toString() {
  return 'CameraInfo(id: $id, facing: $facing, hardwareLevel: $hardwareLevel)';
}


}

/// @nodoc
abstract mixin class _$CameraInfoCopyWith<$Res> implements $CameraInfoCopyWith<$Res> {
  factory _$CameraInfoCopyWith(_CameraInfo value, $Res Function(_CameraInfo) _then) = __$CameraInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String facing, int hardwareLevel
});




}
/// @nodoc
class __$CameraInfoCopyWithImpl<$Res>
    implements _$CameraInfoCopyWith<$Res> {
  __$CameraInfoCopyWithImpl(this._self, this._then);

  final _CameraInfo _self;
  final $Res Function(_CameraInfo) _then;

/// Create a copy of CameraInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? facing = null,Object? hardwareLevel = null,}) {
  return _then(_CameraInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,facing: null == facing ? _self.facing : facing // ignore: cast_nullable_to_non_nullable
as String,hardwareLevel: null == hardwareLevel ? _self.hardwareLevel : hardwareLevel // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

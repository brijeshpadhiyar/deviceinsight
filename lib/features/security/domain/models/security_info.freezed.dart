// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SecurityInfo {

 bool get isRooted; bool get isAdbEnabled; bool get isDeveloperOptionsEnabled; bool get isEncrypted; bool get isUnknownSourcesEnabled; bool get isDeviceSecure; bool get biometricAvailable; String get seLinuxMode;
/// Create a copy of SecurityInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecurityInfoCopyWith<SecurityInfo> get copyWith => _$SecurityInfoCopyWithImpl<SecurityInfo>(this as SecurityInfo, _$identity);

  /// Serializes this SecurityInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecurityInfo&&(identical(other.isRooted, isRooted) || other.isRooted == isRooted)&&(identical(other.isAdbEnabled, isAdbEnabled) || other.isAdbEnabled == isAdbEnabled)&&(identical(other.isDeveloperOptionsEnabled, isDeveloperOptionsEnabled) || other.isDeveloperOptionsEnabled == isDeveloperOptionsEnabled)&&(identical(other.isEncrypted, isEncrypted) || other.isEncrypted == isEncrypted)&&(identical(other.isUnknownSourcesEnabled, isUnknownSourcesEnabled) || other.isUnknownSourcesEnabled == isUnknownSourcesEnabled)&&(identical(other.isDeviceSecure, isDeviceSecure) || other.isDeviceSecure == isDeviceSecure)&&(identical(other.biometricAvailable, biometricAvailable) || other.biometricAvailable == biometricAvailable)&&(identical(other.seLinuxMode, seLinuxMode) || other.seLinuxMode == seLinuxMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isRooted,isAdbEnabled,isDeveloperOptionsEnabled,isEncrypted,isUnknownSourcesEnabled,isDeviceSecure,biometricAvailable,seLinuxMode);

@override
String toString() {
  return 'SecurityInfo(isRooted: $isRooted, isAdbEnabled: $isAdbEnabled, isDeveloperOptionsEnabled: $isDeveloperOptionsEnabled, isEncrypted: $isEncrypted, isUnknownSourcesEnabled: $isUnknownSourcesEnabled, isDeviceSecure: $isDeviceSecure, biometricAvailable: $biometricAvailable, seLinuxMode: $seLinuxMode)';
}


}

/// @nodoc
abstract mixin class $SecurityInfoCopyWith<$Res>  {
  factory $SecurityInfoCopyWith(SecurityInfo value, $Res Function(SecurityInfo) _then) = _$SecurityInfoCopyWithImpl;
@useResult
$Res call({
 bool isRooted, bool isAdbEnabled, bool isDeveloperOptionsEnabled, bool isEncrypted, bool isUnknownSourcesEnabled, bool isDeviceSecure, bool biometricAvailable, String seLinuxMode
});




}
/// @nodoc
class _$SecurityInfoCopyWithImpl<$Res>
    implements $SecurityInfoCopyWith<$Res> {
  _$SecurityInfoCopyWithImpl(this._self, this._then);

  final SecurityInfo _self;
  final $Res Function(SecurityInfo) _then;

/// Create a copy of SecurityInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isRooted = null,Object? isAdbEnabled = null,Object? isDeveloperOptionsEnabled = null,Object? isEncrypted = null,Object? isUnknownSourcesEnabled = null,Object? isDeviceSecure = null,Object? biometricAvailable = null,Object? seLinuxMode = null,}) {
  return _then(_self.copyWith(
isRooted: null == isRooted ? _self.isRooted : isRooted // ignore: cast_nullable_to_non_nullable
as bool,isAdbEnabled: null == isAdbEnabled ? _self.isAdbEnabled : isAdbEnabled // ignore: cast_nullable_to_non_nullable
as bool,isDeveloperOptionsEnabled: null == isDeveloperOptionsEnabled ? _self.isDeveloperOptionsEnabled : isDeveloperOptionsEnabled // ignore: cast_nullable_to_non_nullable
as bool,isEncrypted: null == isEncrypted ? _self.isEncrypted : isEncrypted // ignore: cast_nullable_to_non_nullable
as bool,isUnknownSourcesEnabled: null == isUnknownSourcesEnabled ? _self.isUnknownSourcesEnabled : isUnknownSourcesEnabled // ignore: cast_nullable_to_non_nullable
as bool,isDeviceSecure: null == isDeviceSecure ? _self.isDeviceSecure : isDeviceSecure // ignore: cast_nullable_to_non_nullable
as bool,biometricAvailable: null == biometricAvailable ? _self.biometricAvailable : biometricAvailable // ignore: cast_nullable_to_non_nullable
as bool,seLinuxMode: null == seLinuxMode ? _self.seLinuxMode : seLinuxMode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SecurityInfo].
extension SecurityInfoPatterns on SecurityInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecurityInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecurityInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecurityInfo value)  $default,){
final _that = this;
switch (_that) {
case _SecurityInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecurityInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SecurityInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isRooted,  bool isAdbEnabled,  bool isDeveloperOptionsEnabled,  bool isEncrypted,  bool isUnknownSourcesEnabled,  bool isDeviceSecure,  bool biometricAvailable,  String seLinuxMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecurityInfo() when $default != null:
return $default(_that.isRooted,_that.isAdbEnabled,_that.isDeveloperOptionsEnabled,_that.isEncrypted,_that.isUnknownSourcesEnabled,_that.isDeviceSecure,_that.biometricAvailable,_that.seLinuxMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isRooted,  bool isAdbEnabled,  bool isDeveloperOptionsEnabled,  bool isEncrypted,  bool isUnknownSourcesEnabled,  bool isDeviceSecure,  bool biometricAvailable,  String seLinuxMode)  $default,) {final _that = this;
switch (_that) {
case _SecurityInfo():
return $default(_that.isRooted,_that.isAdbEnabled,_that.isDeveloperOptionsEnabled,_that.isEncrypted,_that.isUnknownSourcesEnabled,_that.isDeviceSecure,_that.biometricAvailable,_that.seLinuxMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isRooted,  bool isAdbEnabled,  bool isDeveloperOptionsEnabled,  bool isEncrypted,  bool isUnknownSourcesEnabled,  bool isDeviceSecure,  bool biometricAvailable,  String seLinuxMode)?  $default,) {final _that = this;
switch (_that) {
case _SecurityInfo() when $default != null:
return $default(_that.isRooted,_that.isAdbEnabled,_that.isDeveloperOptionsEnabled,_that.isEncrypted,_that.isUnknownSourcesEnabled,_that.isDeviceSecure,_that.biometricAvailable,_that.seLinuxMode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SecurityInfo implements SecurityInfo {
  const _SecurityInfo({this.isRooted = false, this.isAdbEnabled = false, this.isDeveloperOptionsEnabled = false, this.isEncrypted = false, this.isUnknownSourcesEnabled = false, this.isDeviceSecure = false, this.biometricAvailable = false, this.seLinuxMode = 'Unknown'});
  factory _SecurityInfo.fromJson(Map<String, dynamic> json) => _$SecurityInfoFromJson(json);

@override@JsonKey() final  bool isRooted;
@override@JsonKey() final  bool isAdbEnabled;
@override@JsonKey() final  bool isDeveloperOptionsEnabled;
@override@JsonKey() final  bool isEncrypted;
@override@JsonKey() final  bool isUnknownSourcesEnabled;
@override@JsonKey() final  bool isDeviceSecure;
@override@JsonKey() final  bool biometricAvailable;
@override@JsonKey() final  String seLinuxMode;

/// Create a copy of SecurityInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecurityInfoCopyWith<_SecurityInfo> get copyWith => __$SecurityInfoCopyWithImpl<_SecurityInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SecurityInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecurityInfo&&(identical(other.isRooted, isRooted) || other.isRooted == isRooted)&&(identical(other.isAdbEnabled, isAdbEnabled) || other.isAdbEnabled == isAdbEnabled)&&(identical(other.isDeveloperOptionsEnabled, isDeveloperOptionsEnabled) || other.isDeveloperOptionsEnabled == isDeveloperOptionsEnabled)&&(identical(other.isEncrypted, isEncrypted) || other.isEncrypted == isEncrypted)&&(identical(other.isUnknownSourcesEnabled, isUnknownSourcesEnabled) || other.isUnknownSourcesEnabled == isUnknownSourcesEnabled)&&(identical(other.isDeviceSecure, isDeviceSecure) || other.isDeviceSecure == isDeviceSecure)&&(identical(other.biometricAvailable, biometricAvailable) || other.biometricAvailable == biometricAvailable)&&(identical(other.seLinuxMode, seLinuxMode) || other.seLinuxMode == seLinuxMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isRooted,isAdbEnabled,isDeveloperOptionsEnabled,isEncrypted,isUnknownSourcesEnabled,isDeviceSecure,biometricAvailable,seLinuxMode);

@override
String toString() {
  return 'SecurityInfo(isRooted: $isRooted, isAdbEnabled: $isAdbEnabled, isDeveloperOptionsEnabled: $isDeveloperOptionsEnabled, isEncrypted: $isEncrypted, isUnknownSourcesEnabled: $isUnknownSourcesEnabled, isDeviceSecure: $isDeviceSecure, biometricAvailable: $biometricAvailable, seLinuxMode: $seLinuxMode)';
}


}

/// @nodoc
abstract mixin class _$SecurityInfoCopyWith<$Res> implements $SecurityInfoCopyWith<$Res> {
  factory _$SecurityInfoCopyWith(_SecurityInfo value, $Res Function(_SecurityInfo) _then) = __$SecurityInfoCopyWithImpl;
@override @useResult
$Res call({
 bool isRooted, bool isAdbEnabled, bool isDeveloperOptionsEnabled, bool isEncrypted, bool isUnknownSourcesEnabled, bool isDeviceSecure, bool biometricAvailable, String seLinuxMode
});




}
/// @nodoc
class __$SecurityInfoCopyWithImpl<$Res>
    implements _$SecurityInfoCopyWith<$Res> {
  __$SecurityInfoCopyWithImpl(this._self, this._then);

  final _SecurityInfo _self;
  final $Res Function(_SecurityInfo) _then;

/// Create a copy of SecurityInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isRooted = null,Object? isAdbEnabled = null,Object? isDeveloperOptionsEnabled = null,Object? isEncrypted = null,Object? isUnknownSourcesEnabled = null,Object? isDeviceSecure = null,Object? biometricAvailable = null,Object? seLinuxMode = null,}) {
  return _then(_SecurityInfo(
isRooted: null == isRooted ? _self.isRooted : isRooted // ignore: cast_nullable_to_non_nullable
as bool,isAdbEnabled: null == isAdbEnabled ? _self.isAdbEnabled : isAdbEnabled // ignore: cast_nullable_to_non_nullable
as bool,isDeveloperOptionsEnabled: null == isDeveloperOptionsEnabled ? _self.isDeveloperOptionsEnabled : isDeveloperOptionsEnabled // ignore: cast_nullable_to_non_nullable
as bool,isEncrypted: null == isEncrypted ? _self.isEncrypted : isEncrypted // ignore: cast_nullable_to_non_nullable
as bool,isUnknownSourcesEnabled: null == isUnknownSourcesEnabled ? _self.isUnknownSourcesEnabled : isUnknownSourcesEnabled // ignore: cast_nullable_to_non_nullable
as bool,isDeviceSecure: null == isDeviceSecure ? _self.isDeviceSecure : isDeviceSecure // ignore: cast_nullable_to_non_nullable
as bool,biometricAvailable: null == biometricAvailable ? _self.biometricAvailable : biometricAvailable // ignore: cast_nullable_to_non_nullable
as bool,seLinuxMode: null == seLinuxMode ? _self.seLinuxMode : seLinuxMode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

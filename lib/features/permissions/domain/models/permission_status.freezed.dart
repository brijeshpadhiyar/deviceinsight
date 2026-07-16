// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PermissionStatus {

 bool get hasUsageStats; bool get hasOverlay; bool get hasLocation; bool get hasStorage; bool get hasCamera; bool get hasSensors; bool get hasNotifications;
/// Create a copy of PermissionStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionStatusCopyWith<PermissionStatus> get copyWith => _$PermissionStatusCopyWithImpl<PermissionStatus>(this as PermissionStatus, _$identity);

  /// Serializes this PermissionStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionStatus&&(identical(other.hasUsageStats, hasUsageStats) || other.hasUsageStats == hasUsageStats)&&(identical(other.hasOverlay, hasOverlay) || other.hasOverlay == hasOverlay)&&(identical(other.hasLocation, hasLocation) || other.hasLocation == hasLocation)&&(identical(other.hasStorage, hasStorage) || other.hasStorage == hasStorage)&&(identical(other.hasCamera, hasCamera) || other.hasCamera == hasCamera)&&(identical(other.hasSensors, hasSensors) || other.hasSensors == hasSensors)&&(identical(other.hasNotifications, hasNotifications) || other.hasNotifications == hasNotifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasUsageStats,hasOverlay,hasLocation,hasStorage,hasCamera,hasSensors,hasNotifications);

@override
String toString() {
  return 'PermissionStatus(hasUsageStats: $hasUsageStats, hasOverlay: $hasOverlay, hasLocation: $hasLocation, hasStorage: $hasStorage, hasCamera: $hasCamera, hasSensors: $hasSensors, hasNotifications: $hasNotifications)';
}


}

/// @nodoc
abstract mixin class $PermissionStatusCopyWith<$Res>  {
  factory $PermissionStatusCopyWith(PermissionStatus value, $Res Function(PermissionStatus) _then) = _$PermissionStatusCopyWithImpl;
@useResult
$Res call({
 bool hasUsageStats, bool hasOverlay, bool hasLocation, bool hasStorage, bool hasCamera, bool hasSensors, bool hasNotifications
});




}
/// @nodoc
class _$PermissionStatusCopyWithImpl<$Res>
    implements $PermissionStatusCopyWith<$Res> {
  _$PermissionStatusCopyWithImpl(this._self, this._then);

  final PermissionStatus _self;
  final $Res Function(PermissionStatus) _then;

/// Create a copy of PermissionStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasUsageStats = null,Object? hasOverlay = null,Object? hasLocation = null,Object? hasStorage = null,Object? hasCamera = null,Object? hasSensors = null,Object? hasNotifications = null,}) {
  return _then(_self.copyWith(
hasUsageStats: null == hasUsageStats ? _self.hasUsageStats : hasUsageStats // ignore: cast_nullable_to_non_nullable
as bool,hasOverlay: null == hasOverlay ? _self.hasOverlay : hasOverlay // ignore: cast_nullable_to_non_nullable
as bool,hasLocation: null == hasLocation ? _self.hasLocation : hasLocation // ignore: cast_nullable_to_non_nullable
as bool,hasStorage: null == hasStorage ? _self.hasStorage : hasStorage // ignore: cast_nullable_to_non_nullable
as bool,hasCamera: null == hasCamera ? _self.hasCamera : hasCamera // ignore: cast_nullable_to_non_nullable
as bool,hasSensors: null == hasSensors ? _self.hasSensors : hasSensors // ignore: cast_nullable_to_non_nullable
as bool,hasNotifications: null == hasNotifications ? _self.hasNotifications : hasNotifications // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PermissionStatus].
extension PermissionStatusPatterns on PermissionStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PermissionStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PermissionStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PermissionStatus value)  $default,){
final _that = this;
switch (_that) {
case _PermissionStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PermissionStatus value)?  $default,){
final _that = this;
switch (_that) {
case _PermissionStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasUsageStats,  bool hasOverlay,  bool hasLocation,  bool hasStorage,  bool hasCamera,  bool hasSensors,  bool hasNotifications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PermissionStatus() when $default != null:
return $default(_that.hasUsageStats,_that.hasOverlay,_that.hasLocation,_that.hasStorage,_that.hasCamera,_that.hasSensors,_that.hasNotifications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasUsageStats,  bool hasOverlay,  bool hasLocation,  bool hasStorage,  bool hasCamera,  bool hasSensors,  bool hasNotifications)  $default,) {final _that = this;
switch (_that) {
case _PermissionStatus():
return $default(_that.hasUsageStats,_that.hasOverlay,_that.hasLocation,_that.hasStorage,_that.hasCamera,_that.hasSensors,_that.hasNotifications);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasUsageStats,  bool hasOverlay,  bool hasLocation,  bool hasStorage,  bool hasCamera,  bool hasSensors,  bool hasNotifications)?  $default,) {final _that = this;
switch (_that) {
case _PermissionStatus() when $default != null:
return $default(_that.hasUsageStats,_that.hasOverlay,_that.hasLocation,_that.hasStorage,_that.hasCamera,_that.hasSensors,_that.hasNotifications);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PermissionStatus implements PermissionStatus {
  const _PermissionStatus({this.hasUsageStats = false, this.hasOverlay = false, this.hasLocation = false, this.hasStorage = false, this.hasCamera = false, this.hasSensors = false, this.hasNotifications = false});
  factory _PermissionStatus.fromJson(Map<String, dynamic> json) => _$PermissionStatusFromJson(json);

@override@JsonKey() final  bool hasUsageStats;
@override@JsonKey() final  bool hasOverlay;
@override@JsonKey() final  bool hasLocation;
@override@JsonKey() final  bool hasStorage;
@override@JsonKey() final  bool hasCamera;
@override@JsonKey() final  bool hasSensors;
@override@JsonKey() final  bool hasNotifications;

/// Create a copy of PermissionStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PermissionStatusCopyWith<_PermissionStatus> get copyWith => __$PermissionStatusCopyWithImpl<_PermissionStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PermissionStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermissionStatus&&(identical(other.hasUsageStats, hasUsageStats) || other.hasUsageStats == hasUsageStats)&&(identical(other.hasOverlay, hasOverlay) || other.hasOverlay == hasOverlay)&&(identical(other.hasLocation, hasLocation) || other.hasLocation == hasLocation)&&(identical(other.hasStorage, hasStorage) || other.hasStorage == hasStorage)&&(identical(other.hasCamera, hasCamera) || other.hasCamera == hasCamera)&&(identical(other.hasSensors, hasSensors) || other.hasSensors == hasSensors)&&(identical(other.hasNotifications, hasNotifications) || other.hasNotifications == hasNotifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasUsageStats,hasOverlay,hasLocation,hasStorage,hasCamera,hasSensors,hasNotifications);

@override
String toString() {
  return 'PermissionStatus(hasUsageStats: $hasUsageStats, hasOverlay: $hasOverlay, hasLocation: $hasLocation, hasStorage: $hasStorage, hasCamera: $hasCamera, hasSensors: $hasSensors, hasNotifications: $hasNotifications)';
}


}

/// @nodoc
abstract mixin class _$PermissionStatusCopyWith<$Res> implements $PermissionStatusCopyWith<$Res> {
  factory _$PermissionStatusCopyWith(_PermissionStatus value, $Res Function(_PermissionStatus) _then) = __$PermissionStatusCopyWithImpl;
@override @useResult
$Res call({
 bool hasUsageStats, bool hasOverlay, bool hasLocation, bool hasStorage, bool hasCamera, bool hasSensors, bool hasNotifications
});




}
/// @nodoc
class __$PermissionStatusCopyWithImpl<$Res>
    implements _$PermissionStatusCopyWith<$Res> {
  __$PermissionStatusCopyWithImpl(this._self, this._then);

  final _PermissionStatus _self;
  final $Res Function(_PermissionStatus) _then;

/// Create a copy of PermissionStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasUsageStats = null,Object? hasOverlay = null,Object? hasLocation = null,Object? hasStorage = null,Object? hasCamera = null,Object? hasSensors = null,Object? hasNotifications = null,}) {
  return _then(_PermissionStatus(
hasUsageStats: null == hasUsageStats ? _self.hasUsageStats : hasUsageStats // ignore: cast_nullable_to_non_nullable
as bool,hasOverlay: null == hasOverlay ? _self.hasOverlay : hasOverlay // ignore: cast_nullable_to_non_nullable
as bool,hasLocation: null == hasLocation ? _self.hasLocation : hasLocation // ignore: cast_nullable_to_non_nullable
as bool,hasStorage: null == hasStorage ? _self.hasStorage : hasStorage // ignore: cast_nullable_to_non_nullable
as bool,hasCamera: null == hasCamera ? _self.hasCamera : hasCamera // ignore: cast_nullable_to_non_nullable
as bool,hasSensors: null == hasSensors ? _self.hasSensors : hasSensors // ignore: cast_nullable_to_non_nullable
as bool,hasNotifications: null == hasNotifications ? _self.hasNotifications : hasNotifications // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeviceState {

 double get batteryLevel; double get batteryTemp; double get usedMemoryGB; double get totalMemoryGB; double get usedStorageGB; double get totalStorageGB; int get unusedAppsCount; bool get isRooted; bool get isDeveloperOptionsEnabled; bool get isUnknownSourcesEnabled; bool get isScreenLockEnabled; int get pingMs; int get downloadMbps;
/// Create a copy of DeviceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceStateCopyWith<DeviceState> get copyWith => _$DeviceStateCopyWithImpl<DeviceState>(this as DeviceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceState&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.batteryTemp, batteryTemp) || other.batteryTemp == batteryTemp)&&(identical(other.usedMemoryGB, usedMemoryGB) || other.usedMemoryGB == usedMemoryGB)&&(identical(other.totalMemoryGB, totalMemoryGB) || other.totalMemoryGB == totalMemoryGB)&&(identical(other.usedStorageGB, usedStorageGB) || other.usedStorageGB == usedStorageGB)&&(identical(other.totalStorageGB, totalStorageGB) || other.totalStorageGB == totalStorageGB)&&(identical(other.unusedAppsCount, unusedAppsCount) || other.unusedAppsCount == unusedAppsCount)&&(identical(other.isRooted, isRooted) || other.isRooted == isRooted)&&(identical(other.isDeveloperOptionsEnabled, isDeveloperOptionsEnabled) || other.isDeveloperOptionsEnabled == isDeveloperOptionsEnabled)&&(identical(other.isUnknownSourcesEnabled, isUnknownSourcesEnabled) || other.isUnknownSourcesEnabled == isUnknownSourcesEnabled)&&(identical(other.isScreenLockEnabled, isScreenLockEnabled) || other.isScreenLockEnabled == isScreenLockEnabled)&&(identical(other.pingMs, pingMs) || other.pingMs == pingMs)&&(identical(other.downloadMbps, downloadMbps) || other.downloadMbps == downloadMbps));
}


@override
int get hashCode => Object.hash(runtimeType,batteryLevel,batteryTemp,usedMemoryGB,totalMemoryGB,usedStorageGB,totalStorageGB,unusedAppsCount,isRooted,isDeveloperOptionsEnabled,isUnknownSourcesEnabled,isScreenLockEnabled,pingMs,downloadMbps);

@override
String toString() {
  return 'DeviceState(batteryLevel: $batteryLevel, batteryTemp: $batteryTemp, usedMemoryGB: $usedMemoryGB, totalMemoryGB: $totalMemoryGB, usedStorageGB: $usedStorageGB, totalStorageGB: $totalStorageGB, unusedAppsCount: $unusedAppsCount, isRooted: $isRooted, isDeveloperOptionsEnabled: $isDeveloperOptionsEnabled, isUnknownSourcesEnabled: $isUnknownSourcesEnabled, isScreenLockEnabled: $isScreenLockEnabled, pingMs: $pingMs, downloadMbps: $downloadMbps)';
}


}

/// @nodoc
abstract mixin class $DeviceStateCopyWith<$Res>  {
  factory $DeviceStateCopyWith(DeviceState value, $Res Function(DeviceState) _then) = _$DeviceStateCopyWithImpl;
@useResult
$Res call({
 double batteryLevel, double batteryTemp, double usedMemoryGB, double totalMemoryGB, double usedStorageGB, double totalStorageGB, int unusedAppsCount, bool isRooted, bool isDeveloperOptionsEnabled, bool isUnknownSourcesEnabled, bool isScreenLockEnabled, int pingMs, int downloadMbps
});




}
/// @nodoc
class _$DeviceStateCopyWithImpl<$Res>
    implements $DeviceStateCopyWith<$Res> {
  _$DeviceStateCopyWithImpl(this._self, this._then);

  final DeviceState _self;
  final $Res Function(DeviceState) _then;

/// Create a copy of DeviceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? batteryLevel = null,Object? batteryTemp = null,Object? usedMemoryGB = null,Object? totalMemoryGB = null,Object? usedStorageGB = null,Object? totalStorageGB = null,Object? unusedAppsCount = null,Object? isRooted = null,Object? isDeveloperOptionsEnabled = null,Object? isUnknownSourcesEnabled = null,Object? isScreenLockEnabled = null,Object? pingMs = null,Object? downloadMbps = null,}) {
  return _then(_self.copyWith(
batteryLevel: null == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as double,batteryTemp: null == batteryTemp ? _self.batteryTemp : batteryTemp // ignore: cast_nullable_to_non_nullable
as double,usedMemoryGB: null == usedMemoryGB ? _self.usedMemoryGB : usedMemoryGB // ignore: cast_nullable_to_non_nullable
as double,totalMemoryGB: null == totalMemoryGB ? _self.totalMemoryGB : totalMemoryGB // ignore: cast_nullable_to_non_nullable
as double,usedStorageGB: null == usedStorageGB ? _self.usedStorageGB : usedStorageGB // ignore: cast_nullable_to_non_nullable
as double,totalStorageGB: null == totalStorageGB ? _self.totalStorageGB : totalStorageGB // ignore: cast_nullable_to_non_nullable
as double,unusedAppsCount: null == unusedAppsCount ? _self.unusedAppsCount : unusedAppsCount // ignore: cast_nullable_to_non_nullable
as int,isRooted: null == isRooted ? _self.isRooted : isRooted // ignore: cast_nullable_to_non_nullable
as bool,isDeveloperOptionsEnabled: null == isDeveloperOptionsEnabled ? _self.isDeveloperOptionsEnabled : isDeveloperOptionsEnabled // ignore: cast_nullable_to_non_nullable
as bool,isUnknownSourcesEnabled: null == isUnknownSourcesEnabled ? _self.isUnknownSourcesEnabled : isUnknownSourcesEnabled // ignore: cast_nullable_to_non_nullable
as bool,isScreenLockEnabled: null == isScreenLockEnabled ? _self.isScreenLockEnabled : isScreenLockEnabled // ignore: cast_nullable_to_non_nullable
as bool,pingMs: null == pingMs ? _self.pingMs : pingMs // ignore: cast_nullable_to_non_nullable
as int,downloadMbps: null == downloadMbps ? _self.downloadMbps : downloadMbps // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceState].
extension DeviceStatePatterns on DeviceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceState value)  $default,){
final _that = this;
switch (_that) {
case _DeviceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceState value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double batteryLevel,  double batteryTemp,  double usedMemoryGB,  double totalMemoryGB,  double usedStorageGB,  double totalStorageGB,  int unusedAppsCount,  bool isRooted,  bool isDeveloperOptionsEnabled,  bool isUnknownSourcesEnabled,  bool isScreenLockEnabled,  int pingMs,  int downloadMbps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceState() when $default != null:
return $default(_that.batteryLevel,_that.batteryTemp,_that.usedMemoryGB,_that.totalMemoryGB,_that.usedStorageGB,_that.totalStorageGB,_that.unusedAppsCount,_that.isRooted,_that.isDeveloperOptionsEnabled,_that.isUnknownSourcesEnabled,_that.isScreenLockEnabled,_that.pingMs,_that.downloadMbps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double batteryLevel,  double batteryTemp,  double usedMemoryGB,  double totalMemoryGB,  double usedStorageGB,  double totalStorageGB,  int unusedAppsCount,  bool isRooted,  bool isDeveloperOptionsEnabled,  bool isUnknownSourcesEnabled,  bool isScreenLockEnabled,  int pingMs,  int downloadMbps)  $default,) {final _that = this;
switch (_that) {
case _DeviceState():
return $default(_that.batteryLevel,_that.batteryTemp,_that.usedMemoryGB,_that.totalMemoryGB,_that.usedStorageGB,_that.totalStorageGB,_that.unusedAppsCount,_that.isRooted,_that.isDeveloperOptionsEnabled,_that.isUnknownSourcesEnabled,_that.isScreenLockEnabled,_that.pingMs,_that.downloadMbps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double batteryLevel,  double batteryTemp,  double usedMemoryGB,  double totalMemoryGB,  double usedStorageGB,  double totalStorageGB,  int unusedAppsCount,  bool isRooted,  bool isDeveloperOptionsEnabled,  bool isUnknownSourcesEnabled,  bool isScreenLockEnabled,  int pingMs,  int downloadMbps)?  $default,) {final _that = this;
switch (_that) {
case _DeviceState() when $default != null:
return $default(_that.batteryLevel,_that.batteryTemp,_that.usedMemoryGB,_that.totalMemoryGB,_that.usedStorageGB,_that.totalStorageGB,_that.unusedAppsCount,_that.isRooted,_that.isDeveloperOptionsEnabled,_that.isUnknownSourcesEnabled,_that.isScreenLockEnabled,_that.pingMs,_that.downloadMbps);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceState implements DeviceState {
  const _DeviceState({this.batteryLevel = 100.0, this.batteryTemp = 30.0, this.usedMemoryGB = 0.0, this.totalMemoryGB = 1.0, this.usedStorageGB = 0.0, this.totalStorageGB = 1.0, this.unusedAppsCount = 0, this.isRooted = false, this.isDeveloperOptionsEnabled = false, this.isUnknownSourcesEnabled = false, this.isScreenLockEnabled = true, this.pingMs = 0, this.downloadMbps = 0});
  

@override@JsonKey() final  double batteryLevel;
@override@JsonKey() final  double batteryTemp;
@override@JsonKey() final  double usedMemoryGB;
@override@JsonKey() final  double totalMemoryGB;
@override@JsonKey() final  double usedStorageGB;
@override@JsonKey() final  double totalStorageGB;
@override@JsonKey() final  int unusedAppsCount;
@override@JsonKey() final  bool isRooted;
@override@JsonKey() final  bool isDeveloperOptionsEnabled;
@override@JsonKey() final  bool isUnknownSourcesEnabled;
@override@JsonKey() final  bool isScreenLockEnabled;
@override@JsonKey() final  int pingMs;
@override@JsonKey() final  int downloadMbps;

/// Create a copy of DeviceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceStateCopyWith<_DeviceState> get copyWith => __$DeviceStateCopyWithImpl<_DeviceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceState&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.batteryTemp, batteryTemp) || other.batteryTemp == batteryTemp)&&(identical(other.usedMemoryGB, usedMemoryGB) || other.usedMemoryGB == usedMemoryGB)&&(identical(other.totalMemoryGB, totalMemoryGB) || other.totalMemoryGB == totalMemoryGB)&&(identical(other.usedStorageGB, usedStorageGB) || other.usedStorageGB == usedStorageGB)&&(identical(other.totalStorageGB, totalStorageGB) || other.totalStorageGB == totalStorageGB)&&(identical(other.unusedAppsCount, unusedAppsCount) || other.unusedAppsCount == unusedAppsCount)&&(identical(other.isRooted, isRooted) || other.isRooted == isRooted)&&(identical(other.isDeveloperOptionsEnabled, isDeveloperOptionsEnabled) || other.isDeveloperOptionsEnabled == isDeveloperOptionsEnabled)&&(identical(other.isUnknownSourcesEnabled, isUnknownSourcesEnabled) || other.isUnknownSourcesEnabled == isUnknownSourcesEnabled)&&(identical(other.isScreenLockEnabled, isScreenLockEnabled) || other.isScreenLockEnabled == isScreenLockEnabled)&&(identical(other.pingMs, pingMs) || other.pingMs == pingMs)&&(identical(other.downloadMbps, downloadMbps) || other.downloadMbps == downloadMbps));
}


@override
int get hashCode => Object.hash(runtimeType,batteryLevel,batteryTemp,usedMemoryGB,totalMemoryGB,usedStorageGB,totalStorageGB,unusedAppsCount,isRooted,isDeveloperOptionsEnabled,isUnknownSourcesEnabled,isScreenLockEnabled,pingMs,downloadMbps);

@override
String toString() {
  return 'DeviceState(batteryLevel: $batteryLevel, batteryTemp: $batteryTemp, usedMemoryGB: $usedMemoryGB, totalMemoryGB: $totalMemoryGB, usedStorageGB: $usedStorageGB, totalStorageGB: $totalStorageGB, unusedAppsCount: $unusedAppsCount, isRooted: $isRooted, isDeveloperOptionsEnabled: $isDeveloperOptionsEnabled, isUnknownSourcesEnabled: $isUnknownSourcesEnabled, isScreenLockEnabled: $isScreenLockEnabled, pingMs: $pingMs, downloadMbps: $downloadMbps)';
}


}

/// @nodoc
abstract mixin class _$DeviceStateCopyWith<$Res> implements $DeviceStateCopyWith<$Res> {
  factory _$DeviceStateCopyWith(_DeviceState value, $Res Function(_DeviceState) _then) = __$DeviceStateCopyWithImpl;
@override @useResult
$Res call({
 double batteryLevel, double batteryTemp, double usedMemoryGB, double totalMemoryGB, double usedStorageGB, double totalStorageGB, int unusedAppsCount, bool isRooted, bool isDeveloperOptionsEnabled, bool isUnknownSourcesEnabled, bool isScreenLockEnabled, int pingMs, int downloadMbps
});




}
/// @nodoc
class __$DeviceStateCopyWithImpl<$Res>
    implements _$DeviceStateCopyWith<$Res> {
  __$DeviceStateCopyWithImpl(this._self, this._then);

  final _DeviceState _self;
  final $Res Function(_DeviceState) _then;

/// Create a copy of DeviceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? batteryLevel = null,Object? batteryTemp = null,Object? usedMemoryGB = null,Object? totalMemoryGB = null,Object? usedStorageGB = null,Object? totalStorageGB = null,Object? unusedAppsCount = null,Object? isRooted = null,Object? isDeveloperOptionsEnabled = null,Object? isUnknownSourcesEnabled = null,Object? isScreenLockEnabled = null,Object? pingMs = null,Object? downloadMbps = null,}) {
  return _then(_DeviceState(
batteryLevel: null == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as double,batteryTemp: null == batteryTemp ? _self.batteryTemp : batteryTemp // ignore: cast_nullable_to_non_nullable
as double,usedMemoryGB: null == usedMemoryGB ? _self.usedMemoryGB : usedMemoryGB // ignore: cast_nullable_to_non_nullable
as double,totalMemoryGB: null == totalMemoryGB ? _self.totalMemoryGB : totalMemoryGB // ignore: cast_nullable_to_non_nullable
as double,usedStorageGB: null == usedStorageGB ? _self.usedStorageGB : usedStorageGB // ignore: cast_nullable_to_non_nullable
as double,totalStorageGB: null == totalStorageGB ? _self.totalStorageGB : totalStorageGB // ignore: cast_nullable_to_non_nullable
as double,unusedAppsCount: null == unusedAppsCount ? _self.unusedAppsCount : unusedAppsCount // ignore: cast_nullable_to_non_nullable
as int,isRooted: null == isRooted ? _self.isRooted : isRooted // ignore: cast_nullable_to_non_nullable
as bool,isDeveloperOptionsEnabled: null == isDeveloperOptionsEnabled ? _self.isDeveloperOptionsEnabled : isDeveloperOptionsEnabled // ignore: cast_nullable_to_non_nullable
as bool,isUnknownSourcesEnabled: null == isUnknownSourcesEnabled ? _self.isUnknownSourcesEnabled : isUnknownSourcesEnabled // ignore: cast_nullable_to_non_nullable
as bool,isScreenLockEnabled: null == isScreenLockEnabled ? _self.isScreenLockEnabled : isScreenLockEnabled // ignore: cast_nullable_to_non_nullable
as bool,pingMs: null == pingMs ? _self.pingMs : pingMs // ignore: cast_nullable_to_non_nullable
as int,downloadMbps: null == downloadMbps ? _self.downloadMbps : downloadMbps // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speed_test_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpeedTestHistory {

 int? get id; DateTime get timestamp; double get downloadMbps; double get uploadMbps; int get pingMs; int get jitterMs; String get serverName; String get networkType; String get connectionInfo;
/// Create a copy of SpeedTestHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeedTestHistoryCopyWith<SpeedTestHistory> get copyWith => _$SpeedTestHistoryCopyWithImpl<SpeedTestHistory>(this as SpeedTestHistory, _$identity);

  /// Serializes this SpeedTestHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeedTestHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.downloadMbps, downloadMbps) || other.downloadMbps == downloadMbps)&&(identical(other.uploadMbps, uploadMbps) || other.uploadMbps == uploadMbps)&&(identical(other.pingMs, pingMs) || other.pingMs == pingMs)&&(identical(other.jitterMs, jitterMs) || other.jitterMs == jitterMs)&&(identical(other.serverName, serverName) || other.serverName == serverName)&&(identical(other.networkType, networkType) || other.networkType == networkType)&&(identical(other.connectionInfo, connectionInfo) || other.connectionInfo == connectionInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp,downloadMbps,uploadMbps,pingMs,jitterMs,serverName,networkType,connectionInfo);

@override
String toString() {
  return 'SpeedTestHistory(id: $id, timestamp: $timestamp, downloadMbps: $downloadMbps, uploadMbps: $uploadMbps, pingMs: $pingMs, jitterMs: $jitterMs, serverName: $serverName, networkType: $networkType, connectionInfo: $connectionInfo)';
}


}

/// @nodoc
abstract mixin class $SpeedTestHistoryCopyWith<$Res>  {
  factory $SpeedTestHistoryCopyWith(SpeedTestHistory value, $Res Function(SpeedTestHistory) _then) = _$SpeedTestHistoryCopyWithImpl;
@useResult
$Res call({
 int? id, DateTime timestamp, double downloadMbps, double uploadMbps, int pingMs, int jitterMs, String serverName, String networkType, String connectionInfo
});




}
/// @nodoc
class _$SpeedTestHistoryCopyWithImpl<$Res>
    implements $SpeedTestHistoryCopyWith<$Res> {
  _$SpeedTestHistoryCopyWithImpl(this._self, this._then);

  final SpeedTestHistory _self;
  final $Res Function(SpeedTestHistory) _then;

/// Create a copy of SpeedTestHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? timestamp = null,Object? downloadMbps = null,Object? uploadMbps = null,Object? pingMs = null,Object? jitterMs = null,Object? serverName = null,Object? networkType = null,Object? connectionInfo = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,downloadMbps: null == downloadMbps ? _self.downloadMbps : downloadMbps // ignore: cast_nullable_to_non_nullable
as double,uploadMbps: null == uploadMbps ? _self.uploadMbps : uploadMbps // ignore: cast_nullable_to_non_nullable
as double,pingMs: null == pingMs ? _self.pingMs : pingMs // ignore: cast_nullable_to_non_nullable
as int,jitterMs: null == jitterMs ? _self.jitterMs : jitterMs // ignore: cast_nullable_to_non_nullable
as int,serverName: null == serverName ? _self.serverName : serverName // ignore: cast_nullable_to_non_nullable
as String,networkType: null == networkType ? _self.networkType : networkType // ignore: cast_nullable_to_non_nullable
as String,connectionInfo: null == connectionInfo ? _self.connectionInfo : connectionInfo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SpeedTestHistory].
extension SpeedTestHistoryPatterns on SpeedTestHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpeedTestHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpeedTestHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpeedTestHistory value)  $default,){
final _that = this;
switch (_that) {
case _SpeedTestHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpeedTestHistory value)?  $default,){
final _that = this;
switch (_that) {
case _SpeedTestHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  DateTime timestamp,  double downloadMbps,  double uploadMbps,  int pingMs,  int jitterMs,  String serverName,  String networkType,  String connectionInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpeedTestHistory() when $default != null:
return $default(_that.id,_that.timestamp,_that.downloadMbps,_that.uploadMbps,_that.pingMs,_that.jitterMs,_that.serverName,_that.networkType,_that.connectionInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  DateTime timestamp,  double downloadMbps,  double uploadMbps,  int pingMs,  int jitterMs,  String serverName,  String networkType,  String connectionInfo)  $default,) {final _that = this;
switch (_that) {
case _SpeedTestHistory():
return $default(_that.id,_that.timestamp,_that.downloadMbps,_that.uploadMbps,_that.pingMs,_that.jitterMs,_that.serverName,_that.networkType,_that.connectionInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  DateTime timestamp,  double downloadMbps,  double uploadMbps,  int pingMs,  int jitterMs,  String serverName,  String networkType,  String connectionInfo)?  $default,) {final _that = this;
switch (_that) {
case _SpeedTestHistory() when $default != null:
return $default(_that.id,_that.timestamp,_that.downloadMbps,_that.uploadMbps,_that.pingMs,_that.jitterMs,_that.serverName,_that.networkType,_that.connectionInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpeedTestHistory implements SpeedTestHistory {
  const _SpeedTestHistory({this.id, required this.timestamp, required this.downloadMbps, required this.uploadMbps, required this.pingMs, required this.jitterMs, required this.serverName, required this.networkType, required this.connectionInfo});
  factory _SpeedTestHistory.fromJson(Map<String, dynamic> json) => _$SpeedTestHistoryFromJson(json);

@override final  int? id;
@override final  DateTime timestamp;
@override final  double downloadMbps;
@override final  double uploadMbps;
@override final  int pingMs;
@override final  int jitterMs;
@override final  String serverName;
@override final  String networkType;
@override final  String connectionInfo;

/// Create a copy of SpeedTestHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeedTestHistoryCopyWith<_SpeedTestHistory> get copyWith => __$SpeedTestHistoryCopyWithImpl<_SpeedTestHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeedTestHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpeedTestHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.downloadMbps, downloadMbps) || other.downloadMbps == downloadMbps)&&(identical(other.uploadMbps, uploadMbps) || other.uploadMbps == uploadMbps)&&(identical(other.pingMs, pingMs) || other.pingMs == pingMs)&&(identical(other.jitterMs, jitterMs) || other.jitterMs == jitterMs)&&(identical(other.serverName, serverName) || other.serverName == serverName)&&(identical(other.networkType, networkType) || other.networkType == networkType)&&(identical(other.connectionInfo, connectionInfo) || other.connectionInfo == connectionInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp,downloadMbps,uploadMbps,pingMs,jitterMs,serverName,networkType,connectionInfo);

@override
String toString() {
  return 'SpeedTestHistory(id: $id, timestamp: $timestamp, downloadMbps: $downloadMbps, uploadMbps: $uploadMbps, pingMs: $pingMs, jitterMs: $jitterMs, serverName: $serverName, networkType: $networkType, connectionInfo: $connectionInfo)';
}


}

/// @nodoc
abstract mixin class _$SpeedTestHistoryCopyWith<$Res> implements $SpeedTestHistoryCopyWith<$Res> {
  factory _$SpeedTestHistoryCopyWith(_SpeedTestHistory value, $Res Function(_SpeedTestHistory) _then) = __$SpeedTestHistoryCopyWithImpl;
@override @useResult
$Res call({
 int? id, DateTime timestamp, double downloadMbps, double uploadMbps, int pingMs, int jitterMs, String serverName, String networkType, String connectionInfo
});




}
/// @nodoc
class __$SpeedTestHistoryCopyWithImpl<$Res>
    implements _$SpeedTestHistoryCopyWith<$Res> {
  __$SpeedTestHistoryCopyWithImpl(this._self, this._then);

  final _SpeedTestHistory _self;
  final $Res Function(_SpeedTestHistory) _then;

/// Create a copy of SpeedTestHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? timestamp = null,Object? downloadMbps = null,Object? uploadMbps = null,Object? pingMs = null,Object? jitterMs = null,Object? serverName = null,Object? networkType = null,Object? connectionInfo = null,}) {
  return _then(_SpeedTestHistory(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,downloadMbps: null == downloadMbps ? _self.downloadMbps : downloadMbps // ignore: cast_nullable_to_non_nullable
as double,uploadMbps: null == uploadMbps ? _self.uploadMbps : uploadMbps // ignore: cast_nullable_to_non_nullable
as double,pingMs: null == pingMs ? _self.pingMs : pingMs // ignore: cast_nullable_to_non_nullable
as int,jitterMs: null == jitterMs ? _self.jitterMs : jitterMs // ignore: cast_nullable_to_non_nullable
as int,serverName: null == serverName ? _self.serverName : serverName // ignore: cast_nullable_to_non_nullable
as String,networkType: null == networkType ? _self.networkType : networkType // ignore: cast_nullable_to_non_nullable
as String,connectionInfo: null == connectionInfo ? _self.connectionInfo : connectionInfo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

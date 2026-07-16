// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NetworkStats {

 String get connectionType; String get ipAddress; String get ipv6Address; List<String> get dnsServers; String get macAddress; String get bssid; int get frequency; double get downloadSpeed; double get uploadSpeed; int get wifiSignalStrength; int get pingMs;
/// Create a copy of NetworkStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkStatsCopyWith<NetworkStats> get copyWith => _$NetworkStatsCopyWithImpl<NetworkStats>(this as NetworkStats, _$identity);

  /// Serializes this NetworkStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkStats&&(identical(other.connectionType, connectionType) || other.connectionType == connectionType)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.ipv6Address, ipv6Address) || other.ipv6Address == ipv6Address)&&const DeepCollectionEquality().equals(other.dnsServers, dnsServers)&&(identical(other.macAddress, macAddress) || other.macAddress == macAddress)&&(identical(other.bssid, bssid) || other.bssid == bssid)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.downloadSpeed, downloadSpeed) || other.downloadSpeed == downloadSpeed)&&(identical(other.uploadSpeed, uploadSpeed) || other.uploadSpeed == uploadSpeed)&&(identical(other.wifiSignalStrength, wifiSignalStrength) || other.wifiSignalStrength == wifiSignalStrength)&&(identical(other.pingMs, pingMs) || other.pingMs == pingMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,connectionType,ipAddress,ipv6Address,const DeepCollectionEquality().hash(dnsServers),macAddress,bssid,frequency,downloadSpeed,uploadSpeed,wifiSignalStrength,pingMs);

@override
String toString() {
  return 'NetworkStats(connectionType: $connectionType, ipAddress: $ipAddress, ipv6Address: $ipv6Address, dnsServers: $dnsServers, macAddress: $macAddress, bssid: $bssid, frequency: $frequency, downloadSpeed: $downloadSpeed, uploadSpeed: $uploadSpeed, wifiSignalStrength: $wifiSignalStrength, pingMs: $pingMs)';
}


}

/// @nodoc
abstract mixin class $NetworkStatsCopyWith<$Res>  {
  factory $NetworkStatsCopyWith(NetworkStats value, $Res Function(NetworkStats) _then) = _$NetworkStatsCopyWithImpl;
@useResult
$Res call({
 String connectionType, String ipAddress, String ipv6Address, List<String> dnsServers, String macAddress, String bssid, int frequency, double downloadSpeed, double uploadSpeed, int wifiSignalStrength, int pingMs
});




}
/// @nodoc
class _$NetworkStatsCopyWithImpl<$Res>
    implements $NetworkStatsCopyWith<$Res> {
  _$NetworkStatsCopyWithImpl(this._self, this._then);

  final NetworkStats _self;
  final $Res Function(NetworkStats) _then;

/// Create a copy of NetworkStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connectionType = null,Object? ipAddress = null,Object? ipv6Address = null,Object? dnsServers = null,Object? macAddress = null,Object? bssid = null,Object? frequency = null,Object? downloadSpeed = null,Object? uploadSpeed = null,Object? wifiSignalStrength = null,Object? pingMs = null,}) {
  return _then(_self.copyWith(
connectionType: null == connectionType ? _self.connectionType : connectionType // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,ipv6Address: null == ipv6Address ? _self.ipv6Address : ipv6Address // ignore: cast_nullable_to_non_nullable
as String,dnsServers: null == dnsServers ? _self.dnsServers : dnsServers // ignore: cast_nullable_to_non_nullable
as List<String>,macAddress: null == macAddress ? _self.macAddress : macAddress // ignore: cast_nullable_to_non_nullable
as String,bssid: null == bssid ? _self.bssid : bssid // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as int,downloadSpeed: null == downloadSpeed ? _self.downloadSpeed : downloadSpeed // ignore: cast_nullable_to_non_nullable
as double,uploadSpeed: null == uploadSpeed ? _self.uploadSpeed : uploadSpeed // ignore: cast_nullable_to_non_nullable
as double,wifiSignalStrength: null == wifiSignalStrength ? _self.wifiSignalStrength : wifiSignalStrength // ignore: cast_nullable_to_non_nullable
as int,pingMs: null == pingMs ? _self.pingMs : pingMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NetworkStats].
extension NetworkStatsPatterns on NetworkStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NetworkStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NetworkStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NetworkStats value)  $default,){
final _that = this;
switch (_that) {
case _NetworkStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NetworkStats value)?  $default,){
final _that = this;
switch (_that) {
case _NetworkStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String connectionType,  String ipAddress,  String ipv6Address,  List<String> dnsServers,  String macAddress,  String bssid,  int frequency,  double downloadSpeed,  double uploadSpeed,  int wifiSignalStrength,  int pingMs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NetworkStats() when $default != null:
return $default(_that.connectionType,_that.ipAddress,_that.ipv6Address,_that.dnsServers,_that.macAddress,_that.bssid,_that.frequency,_that.downloadSpeed,_that.uploadSpeed,_that.wifiSignalStrength,_that.pingMs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String connectionType,  String ipAddress,  String ipv6Address,  List<String> dnsServers,  String macAddress,  String bssid,  int frequency,  double downloadSpeed,  double uploadSpeed,  int wifiSignalStrength,  int pingMs)  $default,) {final _that = this;
switch (_that) {
case _NetworkStats():
return $default(_that.connectionType,_that.ipAddress,_that.ipv6Address,_that.dnsServers,_that.macAddress,_that.bssid,_that.frequency,_that.downloadSpeed,_that.uploadSpeed,_that.wifiSignalStrength,_that.pingMs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String connectionType,  String ipAddress,  String ipv6Address,  List<String> dnsServers,  String macAddress,  String bssid,  int frequency,  double downloadSpeed,  double uploadSpeed,  int wifiSignalStrength,  int pingMs)?  $default,) {final _that = this;
switch (_that) {
case _NetworkStats() when $default != null:
return $default(_that.connectionType,_that.ipAddress,_that.ipv6Address,_that.dnsServers,_that.macAddress,_that.bssid,_that.frequency,_that.downloadSpeed,_that.uploadSpeed,_that.wifiSignalStrength,_that.pingMs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NetworkStats implements NetworkStats {
  const _NetworkStats({this.connectionType = 'Disconnected', this.ipAddress = 'Unknown', this.ipv6Address = 'Unknown', final  List<String> dnsServers = const [], this.macAddress = 'Unknown', this.bssid = 'Unknown', this.frequency = 0, this.downloadSpeed = 0.0, this.uploadSpeed = 0.0, this.wifiSignalStrength = -1, this.pingMs = 0}): _dnsServers = dnsServers;
  factory _NetworkStats.fromJson(Map<String, dynamic> json) => _$NetworkStatsFromJson(json);

@override@JsonKey() final  String connectionType;
@override@JsonKey() final  String ipAddress;
@override@JsonKey() final  String ipv6Address;
 final  List<String> _dnsServers;
@override@JsonKey() List<String> get dnsServers {
  if (_dnsServers is EqualUnmodifiableListView) return _dnsServers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dnsServers);
}

@override@JsonKey() final  String macAddress;
@override@JsonKey() final  String bssid;
@override@JsonKey() final  int frequency;
@override@JsonKey() final  double downloadSpeed;
@override@JsonKey() final  double uploadSpeed;
@override@JsonKey() final  int wifiSignalStrength;
@override@JsonKey() final  int pingMs;

/// Create a copy of NetworkStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkStatsCopyWith<_NetworkStats> get copyWith => __$NetworkStatsCopyWithImpl<_NetworkStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NetworkStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkStats&&(identical(other.connectionType, connectionType) || other.connectionType == connectionType)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.ipv6Address, ipv6Address) || other.ipv6Address == ipv6Address)&&const DeepCollectionEquality().equals(other._dnsServers, _dnsServers)&&(identical(other.macAddress, macAddress) || other.macAddress == macAddress)&&(identical(other.bssid, bssid) || other.bssid == bssid)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.downloadSpeed, downloadSpeed) || other.downloadSpeed == downloadSpeed)&&(identical(other.uploadSpeed, uploadSpeed) || other.uploadSpeed == uploadSpeed)&&(identical(other.wifiSignalStrength, wifiSignalStrength) || other.wifiSignalStrength == wifiSignalStrength)&&(identical(other.pingMs, pingMs) || other.pingMs == pingMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,connectionType,ipAddress,ipv6Address,const DeepCollectionEquality().hash(_dnsServers),macAddress,bssid,frequency,downloadSpeed,uploadSpeed,wifiSignalStrength,pingMs);

@override
String toString() {
  return 'NetworkStats(connectionType: $connectionType, ipAddress: $ipAddress, ipv6Address: $ipv6Address, dnsServers: $dnsServers, macAddress: $macAddress, bssid: $bssid, frequency: $frequency, downloadSpeed: $downloadSpeed, uploadSpeed: $uploadSpeed, wifiSignalStrength: $wifiSignalStrength, pingMs: $pingMs)';
}


}

/// @nodoc
abstract mixin class _$NetworkStatsCopyWith<$Res> implements $NetworkStatsCopyWith<$Res> {
  factory _$NetworkStatsCopyWith(_NetworkStats value, $Res Function(_NetworkStats) _then) = __$NetworkStatsCopyWithImpl;
@override @useResult
$Res call({
 String connectionType, String ipAddress, String ipv6Address, List<String> dnsServers, String macAddress, String bssid, int frequency, double downloadSpeed, double uploadSpeed, int wifiSignalStrength, int pingMs
});




}
/// @nodoc
class __$NetworkStatsCopyWithImpl<$Res>
    implements _$NetworkStatsCopyWith<$Res> {
  __$NetworkStatsCopyWithImpl(this._self, this._then);

  final _NetworkStats _self;
  final $Res Function(_NetworkStats) _then;

/// Create a copy of NetworkStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connectionType = null,Object? ipAddress = null,Object? ipv6Address = null,Object? dnsServers = null,Object? macAddress = null,Object? bssid = null,Object? frequency = null,Object? downloadSpeed = null,Object? uploadSpeed = null,Object? wifiSignalStrength = null,Object? pingMs = null,}) {
  return _then(_NetworkStats(
connectionType: null == connectionType ? _self.connectionType : connectionType // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,ipv6Address: null == ipv6Address ? _self.ipv6Address : ipv6Address // ignore: cast_nullable_to_non_nullable
as String,dnsServers: null == dnsServers ? _self._dnsServers : dnsServers // ignore: cast_nullable_to_non_nullable
as List<String>,macAddress: null == macAddress ? _self.macAddress : macAddress // ignore: cast_nullable_to_non_nullable
as String,bssid: null == bssid ? _self.bssid : bssid // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as int,downloadSpeed: null == downloadSpeed ? _self.downloadSpeed : downloadSpeed // ignore: cast_nullable_to_non_nullable
as double,uploadSpeed: null == uploadSpeed ? _self.uploadSpeed : uploadSpeed // ignore: cast_nullable_to_non_nullable
as double,wifiSignalStrength: null == wifiSignalStrength ? _self.wifiSignalStrength : wifiSignalStrength // ignore: cast_nullable_to_non_nullable
as int,pingMs: null == pingMs ? _self.pingMs : pingMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

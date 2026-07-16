// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_properties.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceProperties {

 String get board; String get bootloader; String get hardware; String get device; String get fingerprint; String get host; String get tags;
/// Create a copy of DeviceProperties
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DevicePropertiesCopyWith<DeviceProperties> get copyWith => _$DevicePropertiesCopyWithImpl<DeviceProperties>(this as DeviceProperties, _$identity);

  /// Serializes this DeviceProperties to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceProperties&&(identical(other.board, board) || other.board == board)&&(identical(other.bootloader, bootloader) || other.bootloader == bootloader)&&(identical(other.hardware, hardware) || other.hardware == hardware)&&(identical(other.device, device) || other.device == device)&&(identical(other.fingerprint, fingerprint) || other.fingerprint == fingerprint)&&(identical(other.host, host) || other.host == host)&&(identical(other.tags, tags) || other.tags == tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,board,bootloader,hardware,device,fingerprint,host,tags);

@override
String toString() {
  return 'DeviceProperties(board: $board, bootloader: $bootloader, hardware: $hardware, device: $device, fingerprint: $fingerprint, host: $host, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $DevicePropertiesCopyWith<$Res>  {
  factory $DevicePropertiesCopyWith(DeviceProperties value, $Res Function(DeviceProperties) _then) = _$DevicePropertiesCopyWithImpl;
@useResult
$Res call({
 String board, String bootloader, String hardware, String device, String fingerprint, String host, String tags
});




}
/// @nodoc
class _$DevicePropertiesCopyWithImpl<$Res>
    implements $DevicePropertiesCopyWith<$Res> {
  _$DevicePropertiesCopyWithImpl(this._self, this._then);

  final DeviceProperties _self;
  final $Res Function(DeviceProperties) _then;

/// Create a copy of DeviceProperties
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? board = null,Object? bootloader = null,Object? hardware = null,Object? device = null,Object? fingerprint = null,Object? host = null,Object? tags = null,}) {
  return _then(_self.copyWith(
board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as String,bootloader: null == bootloader ? _self.bootloader : bootloader // ignore: cast_nullable_to_non_nullable
as String,hardware: null == hardware ? _self.hardware : hardware // ignore: cast_nullable_to_non_nullable
as String,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String,fingerprint: null == fingerprint ? _self.fingerprint : fingerprint // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceProperties].
extension DevicePropertiesPatterns on DeviceProperties {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceProperties value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceProperties() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceProperties value)  $default,){
final _that = this;
switch (_that) {
case _DeviceProperties():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceProperties value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceProperties() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String board,  String bootloader,  String hardware,  String device,  String fingerprint,  String host,  String tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceProperties() when $default != null:
return $default(_that.board,_that.bootloader,_that.hardware,_that.device,_that.fingerprint,_that.host,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String board,  String bootloader,  String hardware,  String device,  String fingerprint,  String host,  String tags)  $default,) {final _that = this;
switch (_that) {
case _DeviceProperties():
return $default(_that.board,_that.bootloader,_that.hardware,_that.device,_that.fingerprint,_that.host,_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String board,  String bootloader,  String hardware,  String device,  String fingerprint,  String host,  String tags)?  $default,) {final _that = this;
switch (_that) {
case _DeviceProperties() when $default != null:
return $default(_that.board,_that.bootloader,_that.hardware,_that.device,_that.fingerprint,_that.host,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceProperties implements DeviceProperties {
  const _DeviceProperties({this.board = 'Unknown', this.bootloader = 'Unknown', this.hardware = 'Unknown', this.device = 'Unknown', this.fingerprint = 'Unknown', this.host = 'Unknown', this.tags = 'Unknown'});
  factory _DeviceProperties.fromJson(Map<String, dynamic> json) => _$DevicePropertiesFromJson(json);

@override@JsonKey() final  String board;
@override@JsonKey() final  String bootloader;
@override@JsonKey() final  String hardware;
@override@JsonKey() final  String device;
@override@JsonKey() final  String fingerprint;
@override@JsonKey() final  String host;
@override@JsonKey() final  String tags;

/// Create a copy of DeviceProperties
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DevicePropertiesCopyWith<_DeviceProperties> get copyWith => __$DevicePropertiesCopyWithImpl<_DeviceProperties>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DevicePropertiesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceProperties&&(identical(other.board, board) || other.board == board)&&(identical(other.bootloader, bootloader) || other.bootloader == bootloader)&&(identical(other.hardware, hardware) || other.hardware == hardware)&&(identical(other.device, device) || other.device == device)&&(identical(other.fingerprint, fingerprint) || other.fingerprint == fingerprint)&&(identical(other.host, host) || other.host == host)&&(identical(other.tags, tags) || other.tags == tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,board,bootloader,hardware,device,fingerprint,host,tags);

@override
String toString() {
  return 'DeviceProperties(board: $board, bootloader: $bootloader, hardware: $hardware, device: $device, fingerprint: $fingerprint, host: $host, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$DevicePropertiesCopyWith<$Res> implements $DevicePropertiesCopyWith<$Res> {
  factory _$DevicePropertiesCopyWith(_DeviceProperties value, $Res Function(_DeviceProperties) _then) = __$DevicePropertiesCopyWithImpl;
@override @useResult
$Res call({
 String board, String bootloader, String hardware, String device, String fingerprint, String host, String tags
});




}
/// @nodoc
class __$DevicePropertiesCopyWithImpl<$Res>
    implements _$DevicePropertiesCopyWith<$Res> {
  __$DevicePropertiesCopyWithImpl(this._self, this._then);

  final _DeviceProperties _self;
  final $Res Function(_DeviceProperties) _then;

/// Create a copy of DeviceProperties
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? board = null,Object? bootloader = null,Object? hardware = null,Object? device = null,Object? fingerprint = null,Object? host = null,Object? tags = null,}) {
  return _then(_DeviceProperties(
board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as String,bootloader: null == bootloader ? _self.bootloader : bootloader // ignore: cast_nullable_to_non_nullable
as String,hardware: null == hardware ? _self.hardware : hardware // ignore: cast_nullable_to_non_nullable
as String,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String,fingerprint: null == fingerprint ? _self.fingerprint : fingerprint // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

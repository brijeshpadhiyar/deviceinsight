// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StorageStats {

 int get totalSpace; int get freeSpace; int get usedSpace; double get usagePercentage; double get readSpeed; double get writeSpeed; int get imagesBytes; int get videosBytes; int get audioBytes; int get documentsBytes; int get appsBytes; int get otherBytes;
/// Create a copy of StorageStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorageStatsCopyWith<StorageStats> get copyWith => _$StorageStatsCopyWithImpl<StorageStats>(this as StorageStats, _$identity);

  /// Serializes this StorageStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorageStats&&(identical(other.totalSpace, totalSpace) || other.totalSpace == totalSpace)&&(identical(other.freeSpace, freeSpace) || other.freeSpace == freeSpace)&&(identical(other.usedSpace, usedSpace) || other.usedSpace == usedSpace)&&(identical(other.usagePercentage, usagePercentage) || other.usagePercentage == usagePercentage)&&(identical(other.readSpeed, readSpeed) || other.readSpeed == readSpeed)&&(identical(other.writeSpeed, writeSpeed) || other.writeSpeed == writeSpeed)&&(identical(other.imagesBytes, imagesBytes) || other.imagesBytes == imagesBytes)&&(identical(other.videosBytes, videosBytes) || other.videosBytes == videosBytes)&&(identical(other.audioBytes, audioBytes) || other.audioBytes == audioBytes)&&(identical(other.documentsBytes, documentsBytes) || other.documentsBytes == documentsBytes)&&(identical(other.appsBytes, appsBytes) || other.appsBytes == appsBytes)&&(identical(other.otherBytes, otherBytes) || other.otherBytes == otherBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSpace,freeSpace,usedSpace,usagePercentage,readSpeed,writeSpeed,imagesBytes,videosBytes,audioBytes,documentsBytes,appsBytes,otherBytes);

@override
String toString() {
  return 'StorageStats(totalSpace: $totalSpace, freeSpace: $freeSpace, usedSpace: $usedSpace, usagePercentage: $usagePercentage, readSpeed: $readSpeed, writeSpeed: $writeSpeed, imagesBytes: $imagesBytes, videosBytes: $videosBytes, audioBytes: $audioBytes, documentsBytes: $documentsBytes, appsBytes: $appsBytes, otherBytes: $otherBytes)';
}


}

/// @nodoc
abstract mixin class $StorageStatsCopyWith<$Res>  {
  factory $StorageStatsCopyWith(StorageStats value, $Res Function(StorageStats) _then) = _$StorageStatsCopyWithImpl;
@useResult
$Res call({
 int totalSpace, int freeSpace, int usedSpace, double usagePercentage, double readSpeed, double writeSpeed, int imagesBytes, int videosBytes, int audioBytes, int documentsBytes, int appsBytes, int otherBytes
});




}
/// @nodoc
class _$StorageStatsCopyWithImpl<$Res>
    implements $StorageStatsCopyWith<$Res> {
  _$StorageStatsCopyWithImpl(this._self, this._then);

  final StorageStats _self;
  final $Res Function(StorageStats) _then;

/// Create a copy of StorageStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalSpace = null,Object? freeSpace = null,Object? usedSpace = null,Object? usagePercentage = null,Object? readSpeed = null,Object? writeSpeed = null,Object? imagesBytes = null,Object? videosBytes = null,Object? audioBytes = null,Object? documentsBytes = null,Object? appsBytes = null,Object? otherBytes = null,}) {
  return _then(_self.copyWith(
totalSpace: null == totalSpace ? _self.totalSpace : totalSpace // ignore: cast_nullable_to_non_nullable
as int,freeSpace: null == freeSpace ? _self.freeSpace : freeSpace // ignore: cast_nullable_to_non_nullable
as int,usedSpace: null == usedSpace ? _self.usedSpace : usedSpace // ignore: cast_nullable_to_non_nullable
as int,usagePercentage: null == usagePercentage ? _self.usagePercentage : usagePercentage // ignore: cast_nullable_to_non_nullable
as double,readSpeed: null == readSpeed ? _self.readSpeed : readSpeed // ignore: cast_nullable_to_non_nullable
as double,writeSpeed: null == writeSpeed ? _self.writeSpeed : writeSpeed // ignore: cast_nullable_to_non_nullable
as double,imagesBytes: null == imagesBytes ? _self.imagesBytes : imagesBytes // ignore: cast_nullable_to_non_nullable
as int,videosBytes: null == videosBytes ? _self.videosBytes : videosBytes // ignore: cast_nullable_to_non_nullable
as int,audioBytes: null == audioBytes ? _self.audioBytes : audioBytes // ignore: cast_nullable_to_non_nullable
as int,documentsBytes: null == documentsBytes ? _self.documentsBytes : documentsBytes // ignore: cast_nullable_to_non_nullable
as int,appsBytes: null == appsBytes ? _self.appsBytes : appsBytes // ignore: cast_nullable_to_non_nullable
as int,otherBytes: null == otherBytes ? _self.otherBytes : otherBytes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StorageStats].
extension StorageStatsPatterns on StorageStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StorageStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StorageStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StorageStats value)  $default,){
final _that = this;
switch (_that) {
case _StorageStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StorageStats value)?  $default,){
final _that = this;
switch (_that) {
case _StorageStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalSpace,  int freeSpace,  int usedSpace,  double usagePercentage,  double readSpeed,  double writeSpeed,  int imagesBytes,  int videosBytes,  int audioBytes,  int documentsBytes,  int appsBytes,  int otherBytes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StorageStats() when $default != null:
return $default(_that.totalSpace,_that.freeSpace,_that.usedSpace,_that.usagePercentage,_that.readSpeed,_that.writeSpeed,_that.imagesBytes,_that.videosBytes,_that.audioBytes,_that.documentsBytes,_that.appsBytes,_that.otherBytes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalSpace,  int freeSpace,  int usedSpace,  double usagePercentage,  double readSpeed,  double writeSpeed,  int imagesBytes,  int videosBytes,  int audioBytes,  int documentsBytes,  int appsBytes,  int otherBytes)  $default,) {final _that = this;
switch (_that) {
case _StorageStats():
return $default(_that.totalSpace,_that.freeSpace,_that.usedSpace,_that.usagePercentage,_that.readSpeed,_that.writeSpeed,_that.imagesBytes,_that.videosBytes,_that.audioBytes,_that.documentsBytes,_that.appsBytes,_that.otherBytes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalSpace,  int freeSpace,  int usedSpace,  double usagePercentage,  double readSpeed,  double writeSpeed,  int imagesBytes,  int videosBytes,  int audioBytes,  int documentsBytes,  int appsBytes,  int otherBytes)?  $default,) {final _that = this;
switch (_that) {
case _StorageStats() when $default != null:
return $default(_that.totalSpace,_that.freeSpace,_that.usedSpace,_that.usagePercentage,_that.readSpeed,_that.writeSpeed,_that.imagesBytes,_that.videosBytes,_that.audioBytes,_that.documentsBytes,_that.appsBytes,_that.otherBytes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StorageStats implements StorageStats {
  const _StorageStats({this.totalSpace = 0, this.freeSpace = 0, this.usedSpace = 0, this.usagePercentage = 0.0, this.readSpeed = 0.0, this.writeSpeed = 0.0, this.imagesBytes = 0, this.videosBytes = 0, this.audioBytes = 0, this.documentsBytes = 0, this.appsBytes = 0, this.otherBytes = 0});
  factory _StorageStats.fromJson(Map<String, dynamic> json) => _$StorageStatsFromJson(json);

@override@JsonKey() final  int totalSpace;
@override@JsonKey() final  int freeSpace;
@override@JsonKey() final  int usedSpace;
@override@JsonKey() final  double usagePercentage;
@override@JsonKey() final  double readSpeed;
@override@JsonKey() final  double writeSpeed;
@override@JsonKey() final  int imagesBytes;
@override@JsonKey() final  int videosBytes;
@override@JsonKey() final  int audioBytes;
@override@JsonKey() final  int documentsBytes;
@override@JsonKey() final  int appsBytes;
@override@JsonKey() final  int otherBytes;

/// Create a copy of StorageStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StorageStatsCopyWith<_StorageStats> get copyWith => __$StorageStatsCopyWithImpl<_StorageStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StorageStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StorageStats&&(identical(other.totalSpace, totalSpace) || other.totalSpace == totalSpace)&&(identical(other.freeSpace, freeSpace) || other.freeSpace == freeSpace)&&(identical(other.usedSpace, usedSpace) || other.usedSpace == usedSpace)&&(identical(other.usagePercentage, usagePercentage) || other.usagePercentage == usagePercentage)&&(identical(other.readSpeed, readSpeed) || other.readSpeed == readSpeed)&&(identical(other.writeSpeed, writeSpeed) || other.writeSpeed == writeSpeed)&&(identical(other.imagesBytes, imagesBytes) || other.imagesBytes == imagesBytes)&&(identical(other.videosBytes, videosBytes) || other.videosBytes == videosBytes)&&(identical(other.audioBytes, audioBytes) || other.audioBytes == audioBytes)&&(identical(other.documentsBytes, documentsBytes) || other.documentsBytes == documentsBytes)&&(identical(other.appsBytes, appsBytes) || other.appsBytes == appsBytes)&&(identical(other.otherBytes, otherBytes) || other.otherBytes == otherBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSpace,freeSpace,usedSpace,usagePercentage,readSpeed,writeSpeed,imagesBytes,videosBytes,audioBytes,documentsBytes,appsBytes,otherBytes);

@override
String toString() {
  return 'StorageStats(totalSpace: $totalSpace, freeSpace: $freeSpace, usedSpace: $usedSpace, usagePercentage: $usagePercentage, readSpeed: $readSpeed, writeSpeed: $writeSpeed, imagesBytes: $imagesBytes, videosBytes: $videosBytes, audioBytes: $audioBytes, documentsBytes: $documentsBytes, appsBytes: $appsBytes, otherBytes: $otherBytes)';
}


}

/// @nodoc
abstract mixin class _$StorageStatsCopyWith<$Res> implements $StorageStatsCopyWith<$Res> {
  factory _$StorageStatsCopyWith(_StorageStats value, $Res Function(_StorageStats) _then) = __$StorageStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalSpace, int freeSpace, int usedSpace, double usagePercentage, double readSpeed, double writeSpeed, int imagesBytes, int videosBytes, int audioBytes, int documentsBytes, int appsBytes, int otherBytes
});




}
/// @nodoc
class __$StorageStatsCopyWithImpl<$Res>
    implements _$StorageStatsCopyWith<$Res> {
  __$StorageStatsCopyWithImpl(this._self, this._then);

  final _StorageStats _self;
  final $Res Function(_StorageStats) _then;

/// Create a copy of StorageStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalSpace = null,Object? freeSpace = null,Object? usedSpace = null,Object? usagePercentage = null,Object? readSpeed = null,Object? writeSpeed = null,Object? imagesBytes = null,Object? videosBytes = null,Object? audioBytes = null,Object? documentsBytes = null,Object? appsBytes = null,Object? otherBytes = null,}) {
  return _then(_StorageStats(
totalSpace: null == totalSpace ? _self.totalSpace : totalSpace // ignore: cast_nullable_to_non_nullable
as int,freeSpace: null == freeSpace ? _self.freeSpace : freeSpace // ignore: cast_nullable_to_non_nullable
as int,usedSpace: null == usedSpace ? _self.usedSpace : usedSpace // ignore: cast_nullable_to_non_nullable
as int,usagePercentage: null == usagePercentage ? _self.usagePercentage : usagePercentage // ignore: cast_nullable_to_non_nullable
as double,readSpeed: null == readSpeed ? _self.readSpeed : readSpeed // ignore: cast_nullable_to_non_nullable
as double,writeSpeed: null == writeSpeed ? _self.writeSpeed : writeSpeed // ignore: cast_nullable_to_non_nullable
as double,imagesBytes: null == imagesBytes ? _self.imagesBytes : imagesBytes // ignore: cast_nullable_to_non_nullable
as int,videosBytes: null == videosBytes ? _self.videosBytes : videosBytes // ignore: cast_nullable_to_non_nullable
as int,audioBytes: null == audioBytes ? _self.audioBytes : audioBytes // ignore: cast_nullable_to_non_nullable
as int,documentsBytes: null == documentsBytes ? _self.documentsBytes : documentsBytes // ignore: cast_nullable_to_non_nullable
as int,appsBytes: null == appsBytes ? _self.appsBytes : appsBytes // ignore: cast_nullable_to_non_nullable
as int,otherBytes: null == otherBytes ? _self.otherBytes : otherBytes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

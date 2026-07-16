// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cpu_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CpuInfo {

 double get overallUsage; List<double> get coreUsages; String get architecture; int get coreCount; List<int> get frequencies;
/// Create a copy of CpuInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CpuInfoCopyWith<CpuInfo> get copyWith => _$CpuInfoCopyWithImpl<CpuInfo>(this as CpuInfo, _$identity);

  /// Serializes this CpuInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CpuInfo&&(identical(other.overallUsage, overallUsage) || other.overallUsage == overallUsage)&&const DeepCollectionEquality().equals(other.coreUsages, coreUsages)&&(identical(other.architecture, architecture) || other.architecture == architecture)&&(identical(other.coreCount, coreCount) || other.coreCount == coreCount)&&const DeepCollectionEquality().equals(other.frequencies, frequencies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,overallUsage,const DeepCollectionEquality().hash(coreUsages),architecture,coreCount,const DeepCollectionEquality().hash(frequencies));

@override
String toString() {
  return 'CpuInfo(overallUsage: $overallUsage, coreUsages: $coreUsages, architecture: $architecture, coreCount: $coreCount, frequencies: $frequencies)';
}


}

/// @nodoc
abstract mixin class $CpuInfoCopyWith<$Res>  {
  factory $CpuInfoCopyWith(CpuInfo value, $Res Function(CpuInfo) _then) = _$CpuInfoCopyWithImpl;
@useResult
$Res call({
 double overallUsage, List<double> coreUsages, String architecture, int coreCount, List<int> frequencies
});




}
/// @nodoc
class _$CpuInfoCopyWithImpl<$Res>
    implements $CpuInfoCopyWith<$Res> {
  _$CpuInfoCopyWithImpl(this._self, this._then);

  final CpuInfo _self;
  final $Res Function(CpuInfo) _then;

/// Create a copy of CpuInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? overallUsage = null,Object? coreUsages = null,Object? architecture = null,Object? coreCount = null,Object? frequencies = null,}) {
  return _then(_self.copyWith(
overallUsage: null == overallUsage ? _self.overallUsage : overallUsage // ignore: cast_nullable_to_non_nullable
as double,coreUsages: null == coreUsages ? _self.coreUsages : coreUsages // ignore: cast_nullable_to_non_nullable
as List<double>,architecture: null == architecture ? _self.architecture : architecture // ignore: cast_nullable_to_non_nullable
as String,coreCount: null == coreCount ? _self.coreCount : coreCount // ignore: cast_nullable_to_non_nullable
as int,frequencies: null == frequencies ? _self.frequencies : frequencies // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [CpuInfo].
extension CpuInfoPatterns on CpuInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CpuInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CpuInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CpuInfo value)  $default,){
final _that = this;
switch (_that) {
case _CpuInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CpuInfo value)?  $default,){
final _that = this;
switch (_that) {
case _CpuInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double overallUsage,  List<double> coreUsages,  String architecture,  int coreCount,  List<int> frequencies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CpuInfo() when $default != null:
return $default(_that.overallUsage,_that.coreUsages,_that.architecture,_that.coreCount,_that.frequencies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double overallUsage,  List<double> coreUsages,  String architecture,  int coreCount,  List<int> frequencies)  $default,) {final _that = this;
switch (_that) {
case _CpuInfo():
return $default(_that.overallUsage,_that.coreUsages,_that.architecture,_that.coreCount,_that.frequencies);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double overallUsage,  List<double> coreUsages,  String architecture,  int coreCount,  List<int> frequencies)?  $default,) {final _that = this;
switch (_that) {
case _CpuInfo() when $default != null:
return $default(_that.overallUsage,_that.coreUsages,_that.architecture,_that.coreCount,_that.frequencies);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CpuInfo implements CpuInfo {
  const _CpuInfo({this.overallUsage = 0.0, final  List<double> coreUsages = const [], this.architecture = 'Unknown', this.coreCount = 0, final  List<int> frequencies = const []}): _coreUsages = coreUsages,_frequencies = frequencies;
  factory _CpuInfo.fromJson(Map<String, dynamic> json) => _$CpuInfoFromJson(json);

@override@JsonKey() final  double overallUsage;
 final  List<double> _coreUsages;
@override@JsonKey() List<double> get coreUsages {
  if (_coreUsages is EqualUnmodifiableListView) return _coreUsages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coreUsages);
}

@override@JsonKey() final  String architecture;
@override@JsonKey() final  int coreCount;
 final  List<int> _frequencies;
@override@JsonKey() List<int> get frequencies {
  if (_frequencies is EqualUnmodifiableListView) return _frequencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_frequencies);
}


/// Create a copy of CpuInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CpuInfoCopyWith<_CpuInfo> get copyWith => __$CpuInfoCopyWithImpl<_CpuInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CpuInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CpuInfo&&(identical(other.overallUsage, overallUsage) || other.overallUsage == overallUsage)&&const DeepCollectionEquality().equals(other._coreUsages, _coreUsages)&&(identical(other.architecture, architecture) || other.architecture == architecture)&&(identical(other.coreCount, coreCount) || other.coreCount == coreCount)&&const DeepCollectionEquality().equals(other._frequencies, _frequencies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,overallUsage,const DeepCollectionEquality().hash(_coreUsages),architecture,coreCount,const DeepCollectionEquality().hash(_frequencies));

@override
String toString() {
  return 'CpuInfo(overallUsage: $overallUsage, coreUsages: $coreUsages, architecture: $architecture, coreCount: $coreCount, frequencies: $frequencies)';
}


}

/// @nodoc
abstract mixin class _$CpuInfoCopyWith<$Res> implements $CpuInfoCopyWith<$Res> {
  factory _$CpuInfoCopyWith(_CpuInfo value, $Res Function(_CpuInfo) _then) = __$CpuInfoCopyWithImpl;
@override @useResult
$Res call({
 double overallUsage, List<double> coreUsages, String architecture, int coreCount, List<int> frequencies
});




}
/// @nodoc
class __$CpuInfoCopyWithImpl<$Res>
    implements _$CpuInfoCopyWith<$Res> {
  __$CpuInfoCopyWithImpl(this._self, this._then);

  final _CpuInfo _self;
  final $Res Function(_CpuInfo) _then;

/// Create a copy of CpuInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? overallUsage = null,Object? coreUsages = null,Object? architecture = null,Object? coreCount = null,Object? frequencies = null,}) {
  return _then(_CpuInfo(
overallUsage: null == overallUsage ? _self.overallUsage : overallUsage // ignore: cast_nullable_to_non_nullable
as double,coreUsages: null == coreUsages ? _self._coreUsages : coreUsages // ignore: cast_nullable_to_non_nullable
as List<double>,architecture: null == architecture ? _self.architecture : architecture // ignore: cast_nullable_to_non_nullable
as String,coreCount: null == coreCount ? _self.coreCount : coreCount // ignore: cast_nullable_to_non_nullable
as int,frequencies: null == frequencies ? _self._frequencies : frequencies // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on

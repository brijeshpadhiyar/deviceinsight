// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'display_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DisplayStats {

 int get widthPixels; int get heightPixels; double get refreshRate; int get densityDpi; bool get isHdr;
/// Create a copy of DisplayStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisplayStatsCopyWith<DisplayStats> get copyWith => _$DisplayStatsCopyWithImpl<DisplayStats>(this as DisplayStats, _$identity);

  /// Serializes this DisplayStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisplayStats&&(identical(other.widthPixels, widthPixels) || other.widthPixels == widthPixels)&&(identical(other.heightPixels, heightPixels) || other.heightPixels == heightPixels)&&(identical(other.refreshRate, refreshRate) || other.refreshRate == refreshRate)&&(identical(other.densityDpi, densityDpi) || other.densityDpi == densityDpi)&&(identical(other.isHdr, isHdr) || other.isHdr == isHdr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,widthPixels,heightPixels,refreshRate,densityDpi,isHdr);

@override
String toString() {
  return 'DisplayStats(widthPixels: $widthPixels, heightPixels: $heightPixels, refreshRate: $refreshRate, densityDpi: $densityDpi, isHdr: $isHdr)';
}


}

/// @nodoc
abstract mixin class $DisplayStatsCopyWith<$Res>  {
  factory $DisplayStatsCopyWith(DisplayStats value, $Res Function(DisplayStats) _then) = _$DisplayStatsCopyWithImpl;
@useResult
$Res call({
 int widthPixels, int heightPixels, double refreshRate, int densityDpi, bool isHdr
});




}
/// @nodoc
class _$DisplayStatsCopyWithImpl<$Res>
    implements $DisplayStatsCopyWith<$Res> {
  _$DisplayStatsCopyWithImpl(this._self, this._then);

  final DisplayStats _self;
  final $Res Function(DisplayStats) _then;

/// Create a copy of DisplayStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? widthPixels = null,Object? heightPixels = null,Object? refreshRate = null,Object? densityDpi = null,Object? isHdr = null,}) {
  return _then(_self.copyWith(
widthPixels: null == widthPixels ? _self.widthPixels : widthPixels // ignore: cast_nullable_to_non_nullable
as int,heightPixels: null == heightPixels ? _self.heightPixels : heightPixels // ignore: cast_nullable_to_non_nullable
as int,refreshRate: null == refreshRate ? _self.refreshRate : refreshRate // ignore: cast_nullable_to_non_nullable
as double,densityDpi: null == densityDpi ? _self.densityDpi : densityDpi // ignore: cast_nullable_to_non_nullable
as int,isHdr: null == isHdr ? _self.isHdr : isHdr // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DisplayStats].
extension DisplayStatsPatterns on DisplayStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DisplayStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DisplayStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DisplayStats value)  $default,){
final _that = this;
switch (_that) {
case _DisplayStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DisplayStats value)?  $default,){
final _that = this;
switch (_that) {
case _DisplayStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int widthPixels,  int heightPixels,  double refreshRate,  int densityDpi,  bool isHdr)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DisplayStats() when $default != null:
return $default(_that.widthPixels,_that.heightPixels,_that.refreshRate,_that.densityDpi,_that.isHdr);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int widthPixels,  int heightPixels,  double refreshRate,  int densityDpi,  bool isHdr)  $default,) {final _that = this;
switch (_that) {
case _DisplayStats():
return $default(_that.widthPixels,_that.heightPixels,_that.refreshRate,_that.densityDpi,_that.isHdr);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int widthPixels,  int heightPixels,  double refreshRate,  int densityDpi,  bool isHdr)?  $default,) {final _that = this;
switch (_that) {
case _DisplayStats() when $default != null:
return $default(_that.widthPixels,_that.heightPixels,_that.refreshRate,_that.densityDpi,_that.isHdr);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DisplayStats implements DisplayStats {
  const _DisplayStats({this.widthPixels = 1080, this.heightPixels = 1920, this.refreshRate = 60.0, this.densityDpi = 420, this.isHdr = false});
  factory _DisplayStats.fromJson(Map<String, dynamic> json) => _$DisplayStatsFromJson(json);

@override@JsonKey() final  int widthPixels;
@override@JsonKey() final  int heightPixels;
@override@JsonKey() final  double refreshRate;
@override@JsonKey() final  int densityDpi;
@override@JsonKey() final  bool isHdr;

/// Create a copy of DisplayStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DisplayStatsCopyWith<_DisplayStats> get copyWith => __$DisplayStatsCopyWithImpl<_DisplayStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DisplayStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DisplayStats&&(identical(other.widthPixels, widthPixels) || other.widthPixels == widthPixels)&&(identical(other.heightPixels, heightPixels) || other.heightPixels == heightPixels)&&(identical(other.refreshRate, refreshRate) || other.refreshRate == refreshRate)&&(identical(other.densityDpi, densityDpi) || other.densityDpi == densityDpi)&&(identical(other.isHdr, isHdr) || other.isHdr == isHdr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,widthPixels,heightPixels,refreshRate,densityDpi,isHdr);

@override
String toString() {
  return 'DisplayStats(widthPixels: $widthPixels, heightPixels: $heightPixels, refreshRate: $refreshRate, densityDpi: $densityDpi, isHdr: $isHdr)';
}


}

/// @nodoc
abstract mixin class _$DisplayStatsCopyWith<$Res> implements $DisplayStatsCopyWith<$Res> {
  factory _$DisplayStatsCopyWith(_DisplayStats value, $Res Function(_DisplayStats) _then) = __$DisplayStatsCopyWithImpl;
@override @useResult
$Res call({
 int widthPixels, int heightPixels, double refreshRate, int densityDpi, bool isHdr
});




}
/// @nodoc
class __$DisplayStatsCopyWithImpl<$Res>
    implements _$DisplayStatsCopyWith<$Res> {
  __$DisplayStatsCopyWithImpl(this._self, this._then);

  final _DisplayStats _self;
  final $Res Function(_DisplayStats) _then;

/// Create a copy of DisplayStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? widthPixels = null,Object? heightPixels = null,Object? refreshRate = null,Object? densityDpi = null,Object? isHdr = null,}) {
  return _then(_DisplayStats(
widthPixels: null == widthPixels ? _self.widthPixels : widthPixels // ignore: cast_nullable_to_non_nullable
as int,heightPixels: null == heightPixels ? _self.heightPixels : heightPixels // ignore: cast_nullable_to_non_nullable
as int,refreshRate: null == refreshRate ? _self.refreshRate : refreshRate // ignore: cast_nullable_to_non_nullable
as double,densityDpi: null == densityDpi ? _self.densityDpi : densityDpi // ignore: cast_nullable_to_non_nullable
as int,isHdr: null == isHdr ? _self.isHdr : isHdr // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

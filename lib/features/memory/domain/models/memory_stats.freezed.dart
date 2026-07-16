// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memory_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemoryStats {

 int get totalMemory; int get availableMemory; int get usedMemory; bool get isLowMemory; int get memoryThreshold; int get memoryClass; int get largeMemoryClass;
/// Create a copy of MemoryStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemoryStatsCopyWith<MemoryStats> get copyWith => _$MemoryStatsCopyWithImpl<MemoryStats>(this as MemoryStats, _$identity);

  /// Serializes this MemoryStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemoryStats&&(identical(other.totalMemory, totalMemory) || other.totalMemory == totalMemory)&&(identical(other.availableMemory, availableMemory) || other.availableMemory == availableMemory)&&(identical(other.usedMemory, usedMemory) || other.usedMemory == usedMemory)&&(identical(other.isLowMemory, isLowMemory) || other.isLowMemory == isLowMemory)&&(identical(other.memoryThreshold, memoryThreshold) || other.memoryThreshold == memoryThreshold)&&(identical(other.memoryClass, memoryClass) || other.memoryClass == memoryClass)&&(identical(other.largeMemoryClass, largeMemoryClass) || other.largeMemoryClass == largeMemoryClass));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalMemory,availableMemory,usedMemory,isLowMemory,memoryThreshold,memoryClass,largeMemoryClass);

@override
String toString() {
  return 'MemoryStats(totalMemory: $totalMemory, availableMemory: $availableMemory, usedMemory: $usedMemory, isLowMemory: $isLowMemory, memoryThreshold: $memoryThreshold, memoryClass: $memoryClass, largeMemoryClass: $largeMemoryClass)';
}


}

/// @nodoc
abstract mixin class $MemoryStatsCopyWith<$Res>  {
  factory $MemoryStatsCopyWith(MemoryStats value, $Res Function(MemoryStats) _then) = _$MemoryStatsCopyWithImpl;
@useResult
$Res call({
 int totalMemory, int availableMemory, int usedMemory, bool isLowMemory, int memoryThreshold, int memoryClass, int largeMemoryClass
});




}
/// @nodoc
class _$MemoryStatsCopyWithImpl<$Res>
    implements $MemoryStatsCopyWith<$Res> {
  _$MemoryStatsCopyWithImpl(this._self, this._then);

  final MemoryStats _self;
  final $Res Function(MemoryStats) _then;

/// Create a copy of MemoryStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalMemory = null,Object? availableMemory = null,Object? usedMemory = null,Object? isLowMemory = null,Object? memoryThreshold = null,Object? memoryClass = null,Object? largeMemoryClass = null,}) {
  return _then(_self.copyWith(
totalMemory: null == totalMemory ? _self.totalMemory : totalMemory // ignore: cast_nullable_to_non_nullable
as int,availableMemory: null == availableMemory ? _self.availableMemory : availableMemory // ignore: cast_nullable_to_non_nullable
as int,usedMemory: null == usedMemory ? _self.usedMemory : usedMemory // ignore: cast_nullable_to_non_nullable
as int,isLowMemory: null == isLowMemory ? _self.isLowMemory : isLowMemory // ignore: cast_nullable_to_non_nullable
as bool,memoryThreshold: null == memoryThreshold ? _self.memoryThreshold : memoryThreshold // ignore: cast_nullable_to_non_nullable
as int,memoryClass: null == memoryClass ? _self.memoryClass : memoryClass // ignore: cast_nullable_to_non_nullable
as int,largeMemoryClass: null == largeMemoryClass ? _self.largeMemoryClass : largeMemoryClass // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MemoryStats].
extension MemoryStatsPatterns on MemoryStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemoryStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemoryStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemoryStats value)  $default,){
final _that = this;
switch (_that) {
case _MemoryStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemoryStats value)?  $default,){
final _that = this;
switch (_that) {
case _MemoryStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalMemory,  int availableMemory,  int usedMemory,  bool isLowMemory,  int memoryThreshold,  int memoryClass,  int largeMemoryClass)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemoryStats() when $default != null:
return $default(_that.totalMemory,_that.availableMemory,_that.usedMemory,_that.isLowMemory,_that.memoryThreshold,_that.memoryClass,_that.largeMemoryClass);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalMemory,  int availableMemory,  int usedMemory,  bool isLowMemory,  int memoryThreshold,  int memoryClass,  int largeMemoryClass)  $default,) {final _that = this;
switch (_that) {
case _MemoryStats():
return $default(_that.totalMemory,_that.availableMemory,_that.usedMemory,_that.isLowMemory,_that.memoryThreshold,_that.memoryClass,_that.largeMemoryClass);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalMemory,  int availableMemory,  int usedMemory,  bool isLowMemory,  int memoryThreshold,  int memoryClass,  int largeMemoryClass)?  $default,) {final _that = this;
switch (_that) {
case _MemoryStats() when $default != null:
return $default(_that.totalMemory,_that.availableMemory,_that.usedMemory,_that.isLowMemory,_that.memoryThreshold,_that.memoryClass,_that.largeMemoryClass);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemoryStats implements MemoryStats {
  const _MemoryStats({this.totalMemory = 0, this.availableMemory = 0, this.usedMemory = 0, this.isLowMemory = false, this.memoryThreshold = 0, this.memoryClass = 0, this.largeMemoryClass = 0});
  factory _MemoryStats.fromJson(Map<String, dynamic> json) => _$MemoryStatsFromJson(json);

@override@JsonKey() final  int totalMemory;
@override@JsonKey() final  int availableMemory;
@override@JsonKey() final  int usedMemory;
@override@JsonKey() final  bool isLowMemory;
@override@JsonKey() final  int memoryThreshold;
@override@JsonKey() final  int memoryClass;
@override@JsonKey() final  int largeMemoryClass;

/// Create a copy of MemoryStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemoryStatsCopyWith<_MemoryStats> get copyWith => __$MemoryStatsCopyWithImpl<_MemoryStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemoryStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemoryStats&&(identical(other.totalMemory, totalMemory) || other.totalMemory == totalMemory)&&(identical(other.availableMemory, availableMemory) || other.availableMemory == availableMemory)&&(identical(other.usedMemory, usedMemory) || other.usedMemory == usedMemory)&&(identical(other.isLowMemory, isLowMemory) || other.isLowMemory == isLowMemory)&&(identical(other.memoryThreshold, memoryThreshold) || other.memoryThreshold == memoryThreshold)&&(identical(other.memoryClass, memoryClass) || other.memoryClass == memoryClass)&&(identical(other.largeMemoryClass, largeMemoryClass) || other.largeMemoryClass == largeMemoryClass));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalMemory,availableMemory,usedMemory,isLowMemory,memoryThreshold,memoryClass,largeMemoryClass);

@override
String toString() {
  return 'MemoryStats(totalMemory: $totalMemory, availableMemory: $availableMemory, usedMemory: $usedMemory, isLowMemory: $isLowMemory, memoryThreshold: $memoryThreshold, memoryClass: $memoryClass, largeMemoryClass: $largeMemoryClass)';
}


}

/// @nodoc
abstract mixin class _$MemoryStatsCopyWith<$Res> implements $MemoryStatsCopyWith<$Res> {
  factory _$MemoryStatsCopyWith(_MemoryStats value, $Res Function(_MemoryStats) _then) = __$MemoryStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalMemory, int availableMemory, int usedMemory, bool isLowMemory, int memoryThreshold, int memoryClass, int largeMemoryClass
});




}
/// @nodoc
class __$MemoryStatsCopyWithImpl<$Res>
    implements _$MemoryStatsCopyWith<$Res> {
  __$MemoryStatsCopyWithImpl(this._self, this._then);

  final _MemoryStats _self;
  final $Res Function(_MemoryStats) _then;

/// Create a copy of MemoryStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalMemory = null,Object? availableMemory = null,Object? usedMemory = null,Object? isLowMemory = null,Object? memoryThreshold = null,Object? memoryClass = null,Object? largeMemoryClass = null,}) {
  return _then(_MemoryStats(
totalMemory: null == totalMemory ? _self.totalMemory : totalMemory // ignore: cast_nullable_to_non_nullable
as int,availableMemory: null == availableMemory ? _self.availableMemory : availableMemory // ignore: cast_nullable_to_non_nullable
as int,usedMemory: null == usedMemory ? _self.usedMemory : usedMemory // ignore: cast_nullable_to_non_nullable
as int,isLowMemory: null == isLowMemory ? _self.isLowMemory : isLowMemory // ignore: cast_nullable_to_non_nullable
as bool,memoryThreshold: null == memoryThreshold ? _self.memoryThreshold : memoryThreshold // ignore: cast_nullable_to_non_nullable
as int,memoryClass: null == memoryClass ? _self.memoryClass : memoryClass // ignore: cast_nullable_to_non_nullable
as int,largeMemoryClass: null == largeMemoryClass ? _self.largeMemoryClass : largeMemoryClass // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

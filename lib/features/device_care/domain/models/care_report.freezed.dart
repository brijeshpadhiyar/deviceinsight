// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'care_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CareReport {

 int get overallScore; int get securityScore; int get performanceScore; int get privacyScore; List<CareRecommendation> get recommendations;
/// Create a copy of CareReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CareReportCopyWith<CareReport> get copyWith => _$CareReportCopyWithImpl<CareReport>(this as CareReport, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CareReport&&(identical(other.overallScore, overallScore) || other.overallScore == overallScore)&&(identical(other.securityScore, securityScore) || other.securityScore == securityScore)&&(identical(other.performanceScore, performanceScore) || other.performanceScore == performanceScore)&&(identical(other.privacyScore, privacyScore) || other.privacyScore == privacyScore)&&const DeepCollectionEquality().equals(other.recommendations, recommendations));
}


@override
int get hashCode => Object.hash(runtimeType,overallScore,securityScore,performanceScore,privacyScore,const DeepCollectionEquality().hash(recommendations));

@override
String toString() {
  return 'CareReport(overallScore: $overallScore, securityScore: $securityScore, performanceScore: $performanceScore, privacyScore: $privacyScore, recommendations: $recommendations)';
}


}

/// @nodoc
abstract mixin class $CareReportCopyWith<$Res>  {
  factory $CareReportCopyWith(CareReport value, $Res Function(CareReport) _then) = _$CareReportCopyWithImpl;
@useResult
$Res call({
 int overallScore, int securityScore, int performanceScore, int privacyScore, List<CareRecommendation> recommendations
});




}
/// @nodoc
class _$CareReportCopyWithImpl<$Res>
    implements $CareReportCopyWith<$Res> {
  _$CareReportCopyWithImpl(this._self, this._then);

  final CareReport _self;
  final $Res Function(CareReport) _then;

/// Create a copy of CareReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? overallScore = null,Object? securityScore = null,Object? performanceScore = null,Object? privacyScore = null,Object? recommendations = null,}) {
  return _then(_self.copyWith(
overallScore: null == overallScore ? _self.overallScore : overallScore // ignore: cast_nullable_to_non_nullable
as int,securityScore: null == securityScore ? _self.securityScore : securityScore // ignore: cast_nullable_to_non_nullable
as int,performanceScore: null == performanceScore ? _self.performanceScore : performanceScore // ignore: cast_nullable_to_non_nullable
as int,privacyScore: null == privacyScore ? _self.privacyScore : privacyScore // ignore: cast_nullable_to_non_nullable
as int,recommendations: null == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as List<CareRecommendation>,
  ));
}

}


/// Adds pattern-matching-related methods to [CareReport].
extension CareReportPatterns on CareReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CareReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CareReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CareReport value)  $default,){
final _that = this;
switch (_that) {
case _CareReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CareReport value)?  $default,){
final _that = this;
switch (_that) {
case _CareReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int overallScore,  int securityScore,  int performanceScore,  int privacyScore,  List<CareRecommendation> recommendations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CareReport() when $default != null:
return $default(_that.overallScore,_that.securityScore,_that.performanceScore,_that.privacyScore,_that.recommendations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int overallScore,  int securityScore,  int performanceScore,  int privacyScore,  List<CareRecommendation> recommendations)  $default,) {final _that = this;
switch (_that) {
case _CareReport():
return $default(_that.overallScore,_that.securityScore,_that.performanceScore,_that.privacyScore,_that.recommendations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int overallScore,  int securityScore,  int performanceScore,  int privacyScore,  List<CareRecommendation> recommendations)?  $default,) {final _that = this;
switch (_that) {
case _CareReport() when $default != null:
return $default(_that.overallScore,_that.securityScore,_that.performanceScore,_that.privacyScore,_that.recommendations);case _:
  return null;

}
}

}

/// @nodoc


class _CareReport implements CareReport {
  const _CareReport({required this.overallScore, required this.securityScore, required this.performanceScore, required this.privacyScore, required final  List<CareRecommendation> recommendations}): _recommendations = recommendations;
  

@override final  int overallScore;
@override final  int securityScore;
@override final  int performanceScore;
@override final  int privacyScore;
 final  List<CareRecommendation> _recommendations;
@override List<CareRecommendation> get recommendations {
  if (_recommendations is EqualUnmodifiableListView) return _recommendations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommendations);
}


/// Create a copy of CareReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CareReportCopyWith<_CareReport> get copyWith => __$CareReportCopyWithImpl<_CareReport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CareReport&&(identical(other.overallScore, overallScore) || other.overallScore == overallScore)&&(identical(other.securityScore, securityScore) || other.securityScore == securityScore)&&(identical(other.performanceScore, performanceScore) || other.performanceScore == performanceScore)&&(identical(other.privacyScore, privacyScore) || other.privacyScore == privacyScore)&&const DeepCollectionEquality().equals(other._recommendations, _recommendations));
}


@override
int get hashCode => Object.hash(runtimeType,overallScore,securityScore,performanceScore,privacyScore,const DeepCollectionEquality().hash(_recommendations));

@override
String toString() {
  return 'CareReport(overallScore: $overallScore, securityScore: $securityScore, performanceScore: $performanceScore, privacyScore: $privacyScore, recommendations: $recommendations)';
}


}

/// @nodoc
abstract mixin class _$CareReportCopyWith<$Res> implements $CareReportCopyWith<$Res> {
  factory _$CareReportCopyWith(_CareReport value, $Res Function(_CareReport) _then) = __$CareReportCopyWithImpl;
@override @useResult
$Res call({
 int overallScore, int securityScore, int performanceScore, int privacyScore, List<CareRecommendation> recommendations
});




}
/// @nodoc
class __$CareReportCopyWithImpl<$Res>
    implements _$CareReportCopyWith<$Res> {
  __$CareReportCopyWithImpl(this._self, this._then);

  final _CareReport _self;
  final $Res Function(_CareReport) _then;

/// Create a copy of CareReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? overallScore = null,Object? securityScore = null,Object? performanceScore = null,Object? privacyScore = null,Object? recommendations = null,}) {
  return _then(_CareReport(
overallScore: null == overallScore ? _self.overallScore : overallScore // ignore: cast_nullable_to_non_nullable
as int,securityScore: null == securityScore ? _self.securityScore : securityScore // ignore: cast_nullable_to_non_nullable
as int,performanceScore: null == performanceScore ? _self.performanceScore : performanceScore // ignore: cast_nullable_to_non_nullable
as int,privacyScore: null == privacyScore ? _self.privacyScore : privacyScore // ignore: cast_nullable_to_non_nullable
as int,recommendations: null == recommendations ? _self._recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as List<CareRecommendation>,
  ));
}


}

// dart format on

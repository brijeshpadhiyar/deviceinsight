// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'care_recommendation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CareRecommendation {

 String get title; String get problem; String get solution; String get riskLevel; String get category; String? get actionIntent;
/// Create a copy of CareRecommendation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CareRecommendationCopyWith<CareRecommendation> get copyWith => _$CareRecommendationCopyWithImpl<CareRecommendation>(this as CareRecommendation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CareRecommendation&&(identical(other.title, title) || other.title == title)&&(identical(other.problem, problem) || other.problem == problem)&&(identical(other.solution, solution) || other.solution == solution)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.category, category) || other.category == category)&&(identical(other.actionIntent, actionIntent) || other.actionIntent == actionIntent));
}


@override
int get hashCode => Object.hash(runtimeType,title,problem,solution,riskLevel,category,actionIntent);

@override
String toString() {
  return 'CareRecommendation(title: $title, problem: $problem, solution: $solution, riskLevel: $riskLevel, category: $category, actionIntent: $actionIntent)';
}


}

/// @nodoc
abstract mixin class $CareRecommendationCopyWith<$Res>  {
  factory $CareRecommendationCopyWith(CareRecommendation value, $Res Function(CareRecommendation) _then) = _$CareRecommendationCopyWithImpl;
@useResult
$Res call({
 String title, String problem, String solution, String riskLevel, String category, String? actionIntent
});




}
/// @nodoc
class _$CareRecommendationCopyWithImpl<$Res>
    implements $CareRecommendationCopyWith<$Res> {
  _$CareRecommendationCopyWithImpl(this._self, this._then);

  final CareRecommendation _self;
  final $Res Function(CareRecommendation) _then;

/// Create a copy of CareRecommendation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? problem = null,Object? solution = null,Object? riskLevel = null,Object? category = null,Object? actionIntent = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,problem: null == problem ? _self.problem : problem // ignore: cast_nullable_to_non_nullable
as String,solution: null == solution ? _self.solution : solution // ignore: cast_nullable_to_non_nullable
as String,riskLevel: null == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,actionIntent: freezed == actionIntent ? _self.actionIntent : actionIntent // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CareRecommendation].
extension CareRecommendationPatterns on CareRecommendation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CareRecommendation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CareRecommendation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CareRecommendation value)  $default,){
final _that = this;
switch (_that) {
case _CareRecommendation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CareRecommendation value)?  $default,){
final _that = this;
switch (_that) {
case _CareRecommendation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String problem,  String solution,  String riskLevel,  String category,  String? actionIntent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CareRecommendation() when $default != null:
return $default(_that.title,_that.problem,_that.solution,_that.riskLevel,_that.category,_that.actionIntent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String problem,  String solution,  String riskLevel,  String category,  String? actionIntent)  $default,) {final _that = this;
switch (_that) {
case _CareRecommendation():
return $default(_that.title,_that.problem,_that.solution,_that.riskLevel,_that.category,_that.actionIntent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String problem,  String solution,  String riskLevel,  String category,  String? actionIntent)?  $default,) {final _that = this;
switch (_that) {
case _CareRecommendation() when $default != null:
return $default(_that.title,_that.problem,_that.solution,_that.riskLevel,_that.category,_that.actionIntent);case _:
  return null;

}
}

}

/// @nodoc


class _CareRecommendation implements CareRecommendation {
  const _CareRecommendation({required this.title, required this.problem, required this.solution, required this.riskLevel, required this.category, required this.actionIntent});
  

@override final  String title;
@override final  String problem;
@override final  String solution;
@override final  String riskLevel;
@override final  String category;
@override final  String? actionIntent;

/// Create a copy of CareRecommendation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CareRecommendationCopyWith<_CareRecommendation> get copyWith => __$CareRecommendationCopyWithImpl<_CareRecommendation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CareRecommendation&&(identical(other.title, title) || other.title == title)&&(identical(other.problem, problem) || other.problem == problem)&&(identical(other.solution, solution) || other.solution == solution)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.category, category) || other.category == category)&&(identical(other.actionIntent, actionIntent) || other.actionIntent == actionIntent));
}


@override
int get hashCode => Object.hash(runtimeType,title,problem,solution,riskLevel,category,actionIntent);

@override
String toString() {
  return 'CareRecommendation(title: $title, problem: $problem, solution: $solution, riskLevel: $riskLevel, category: $category, actionIntent: $actionIntent)';
}


}

/// @nodoc
abstract mixin class _$CareRecommendationCopyWith<$Res> implements $CareRecommendationCopyWith<$Res> {
  factory _$CareRecommendationCopyWith(_CareRecommendation value, $Res Function(_CareRecommendation) _then) = __$CareRecommendationCopyWithImpl;
@override @useResult
$Res call({
 String title, String problem, String solution, String riskLevel, String category, String? actionIntent
});




}
/// @nodoc
class __$CareRecommendationCopyWithImpl<$Res>
    implements _$CareRecommendationCopyWith<$Res> {
  __$CareRecommendationCopyWithImpl(this._self, this._then);

  final _CareRecommendation _self;
  final $Res Function(_CareRecommendation) _then;

/// Create a copy of CareRecommendation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? problem = null,Object? solution = null,Object? riskLevel = null,Object? category = null,Object? actionIntent = freezed,}) {
  return _then(_CareRecommendation(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,problem: null == problem ? _self.problem : problem // ignore: cast_nullable_to_non_nullable
as String,solution: null == solution ? _self.solution : solution // ignore: cast_nullable_to_non_nullable
as String,riskLevel: null == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,actionIntent: freezed == actionIntent ? _self.actionIntent : actionIntent // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

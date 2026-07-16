// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppDetails {

 String get name; String get packageName; String get versionName; int get versionCode; bool get isSystemApp; int get installDate; int get updateDate; String get developer; String get apkPath; String get dataDir; int get targetSdk; int get minSdk; int get uid; String get installSource; List<String> get permissions; List<String> get requestedPermissions; List<String> get grantedPermissions; List<String> get activities; List<String> get services; List<String> get receivers; List<String> get providers; int get cacheSize; int get dataSize; int get codeSize; int get totalSize; String get sharedUserId; bool get batteryOptimizationEnabled; String? get error;
/// Create a copy of AppDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppDetailsCopyWith<AppDetails> get copyWith => _$AppDetailsCopyWithImpl<AppDetails>(this as AppDetails, _$identity);

  /// Serializes this AppDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppDetails&&(identical(other.name, name) || other.name == name)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.versionCode, versionCode) || other.versionCode == versionCode)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp)&&(identical(other.installDate, installDate) || other.installDate == installDate)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate)&&(identical(other.developer, developer) || other.developer == developer)&&(identical(other.apkPath, apkPath) || other.apkPath == apkPath)&&(identical(other.dataDir, dataDir) || other.dataDir == dataDir)&&(identical(other.targetSdk, targetSdk) || other.targetSdk == targetSdk)&&(identical(other.minSdk, minSdk) || other.minSdk == minSdk)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.installSource, installSource) || other.installSource == installSource)&&const DeepCollectionEquality().equals(other.permissions, permissions)&&const DeepCollectionEquality().equals(other.requestedPermissions, requestedPermissions)&&const DeepCollectionEquality().equals(other.grantedPermissions, grantedPermissions)&&const DeepCollectionEquality().equals(other.activities, activities)&&const DeepCollectionEquality().equals(other.services, services)&&const DeepCollectionEquality().equals(other.receivers, receivers)&&const DeepCollectionEquality().equals(other.providers, providers)&&(identical(other.cacheSize, cacheSize) || other.cacheSize == cacheSize)&&(identical(other.dataSize, dataSize) || other.dataSize == dataSize)&&(identical(other.codeSize, codeSize) || other.codeSize == codeSize)&&(identical(other.totalSize, totalSize) || other.totalSize == totalSize)&&(identical(other.sharedUserId, sharedUserId) || other.sharedUserId == sharedUserId)&&(identical(other.batteryOptimizationEnabled, batteryOptimizationEnabled) || other.batteryOptimizationEnabled == batteryOptimizationEnabled)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,packageName,versionName,versionCode,isSystemApp,installDate,updateDate,developer,apkPath,dataDir,targetSdk,minSdk,uid,installSource,const DeepCollectionEquality().hash(permissions),const DeepCollectionEquality().hash(requestedPermissions),const DeepCollectionEquality().hash(grantedPermissions),const DeepCollectionEquality().hash(activities),const DeepCollectionEquality().hash(services),const DeepCollectionEquality().hash(receivers),const DeepCollectionEquality().hash(providers),cacheSize,dataSize,codeSize,totalSize,sharedUserId,batteryOptimizationEnabled,error]);

@override
String toString() {
  return 'AppDetails(name: $name, packageName: $packageName, versionName: $versionName, versionCode: $versionCode, isSystemApp: $isSystemApp, installDate: $installDate, updateDate: $updateDate, developer: $developer, apkPath: $apkPath, dataDir: $dataDir, targetSdk: $targetSdk, minSdk: $minSdk, uid: $uid, installSource: $installSource, permissions: $permissions, requestedPermissions: $requestedPermissions, grantedPermissions: $grantedPermissions, activities: $activities, services: $services, receivers: $receivers, providers: $providers, cacheSize: $cacheSize, dataSize: $dataSize, codeSize: $codeSize, totalSize: $totalSize, sharedUserId: $sharedUserId, batteryOptimizationEnabled: $batteryOptimizationEnabled, error: $error)';
}


}

/// @nodoc
abstract mixin class $AppDetailsCopyWith<$Res>  {
  factory $AppDetailsCopyWith(AppDetails value, $Res Function(AppDetails) _then) = _$AppDetailsCopyWithImpl;
@useResult
$Res call({
 String name, String packageName, String versionName, int versionCode, bool isSystemApp, int installDate, int updateDate, String developer, String apkPath, String dataDir, int targetSdk, int minSdk, int uid, String installSource, List<String> permissions, List<String> requestedPermissions, List<String> grantedPermissions, List<String> activities, List<String> services, List<String> receivers, List<String> providers, int cacheSize, int dataSize, int codeSize, int totalSize, String sharedUserId, bool batteryOptimizationEnabled, String? error
});




}
/// @nodoc
class _$AppDetailsCopyWithImpl<$Res>
    implements $AppDetailsCopyWith<$Res> {
  _$AppDetailsCopyWithImpl(this._self, this._then);

  final AppDetails _self;
  final $Res Function(AppDetails) _then;

/// Create a copy of AppDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? packageName = null,Object? versionName = null,Object? versionCode = null,Object? isSystemApp = null,Object? installDate = null,Object? updateDate = null,Object? developer = null,Object? apkPath = null,Object? dataDir = null,Object? targetSdk = null,Object? minSdk = null,Object? uid = null,Object? installSource = null,Object? permissions = null,Object? requestedPermissions = null,Object? grantedPermissions = null,Object? activities = null,Object? services = null,Object? receivers = null,Object? providers = null,Object? cacheSize = null,Object? dataSize = null,Object? codeSize = null,Object? totalSize = null,Object? sharedUserId = null,Object? batteryOptimizationEnabled = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,versionName: null == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,versionCode: null == versionCode ? _self.versionCode : versionCode // ignore: cast_nullable_to_non_nullable
as int,isSystemApp: null == isSystemApp ? _self.isSystemApp : isSystemApp // ignore: cast_nullable_to_non_nullable
as bool,installDate: null == installDate ? _self.installDate : installDate // ignore: cast_nullable_to_non_nullable
as int,updateDate: null == updateDate ? _self.updateDate : updateDate // ignore: cast_nullable_to_non_nullable
as int,developer: null == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as String,apkPath: null == apkPath ? _self.apkPath : apkPath // ignore: cast_nullable_to_non_nullable
as String,dataDir: null == dataDir ? _self.dataDir : dataDir // ignore: cast_nullable_to_non_nullable
as String,targetSdk: null == targetSdk ? _self.targetSdk : targetSdk // ignore: cast_nullable_to_non_nullable
as int,minSdk: null == minSdk ? _self.minSdk : minSdk // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,installSource: null == installSource ? _self.installSource : installSource // ignore: cast_nullable_to_non_nullable
as String,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>,requestedPermissions: null == requestedPermissions ? _self.requestedPermissions : requestedPermissions // ignore: cast_nullable_to_non_nullable
as List<String>,grantedPermissions: null == grantedPermissions ? _self.grantedPermissions : grantedPermissions // ignore: cast_nullable_to_non_nullable
as List<String>,activities: null == activities ? _self.activities : activities // ignore: cast_nullable_to_non_nullable
as List<String>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<String>,receivers: null == receivers ? _self.receivers : receivers // ignore: cast_nullable_to_non_nullable
as List<String>,providers: null == providers ? _self.providers : providers // ignore: cast_nullable_to_non_nullable
as List<String>,cacheSize: null == cacheSize ? _self.cacheSize : cacheSize // ignore: cast_nullable_to_non_nullable
as int,dataSize: null == dataSize ? _self.dataSize : dataSize // ignore: cast_nullable_to_non_nullable
as int,codeSize: null == codeSize ? _self.codeSize : codeSize // ignore: cast_nullable_to_non_nullable
as int,totalSize: null == totalSize ? _self.totalSize : totalSize // ignore: cast_nullable_to_non_nullable
as int,sharedUserId: null == sharedUserId ? _self.sharedUserId : sharedUserId // ignore: cast_nullable_to_non_nullable
as String,batteryOptimizationEnabled: null == batteryOptimizationEnabled ? _self.batteryOptimizationEnabled : batteryOptimizationEnabled // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppDetails].
extension AppDetailsPatterns on AppDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppDetails value)  $default,){
final _that = this;
switch (_that) {
case _AppDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppDetails value)?  $default,){
final _that = this;
switch (_that) {
case _AppDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String packageName,  String versionName,  int versionCode,  bool isSystemApp,  int installDate,  int updateDate,  String developer,  String apkPath,  String dataDir,  int targetSdk,  int minSdk,  int uid,  String installSource,  List<String> permissions,  List<String> requestedPermissions,  List<String> grantedPermissions,  List<String> activities,  List<String> services,  List<String> receivers,  List<String> providers,  int cacheSize,  int dataSize,  int codeSize,  int totalSize,  String sharedUserId,  bool batteryOptimizationEnabled,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppDetails() when $default != null:
return $default(_that.name,_that.packageName,_that.versionName,_that.versionCode,_that.isSystemApp,_that.installDate,_that.updateDate,_that.developer,_that.apkPath,_that.dataDir,_that.targetSdk,_that.minSdk,_that.uid,_that.installSource,_that.permissions,_that.requestedPermissions,_that.grantedPermissions,_that.activities,_that.services,_that.receivers,_that.providers,_that.cacheSize,_that.dataSize,_that.codeSize,_that.totalSize,_that.sharedUserId,_that.batteryOptimizationEnabled,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String packageName,  String versionName,  int versionCode,  bool isSystemApp,  int installDate,  int updateDate,  String developer,  String apkPath,  String dataDir,  int targetSdk,  int minSdk,  int uid,  String installSource,  List<String> permissions,  List<String> requestedPermissions,  List<String> grantedPermissions,  List<String> activities,  List<String> services,  List<String> receivers,  List<String> providers,  int cacheSize,  int dataSize,  int codeSize,  int totalSize,  String sharedUserId,  bool batteryOptimizationEnabled,  String? error)  $default,) {final _that = this;
switch (_that) {
case _AppDetails():
return $default(_that.name,_that.packageName,_that.versionName,_that.versionCode,_that.isSystemApp,_that.installDate,_that.updateDate,_that.developer,_that.apkPath,_that.dataDir,_that.targetSdk,_that.minSdk,_that.uid,_that.installSource,_that.permissions,_that.requestedPermissions,_that.grantedPermissions,_that.activities,_that.services,_that.receivers,_that.providers,_that.cacheSize,_that.dataSize,_that.codeSize,_that.totalSize,_that.sharedUserId,_that.batteryOptimizationEnabled,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String packageName,  String versionName,  int versionCode,  bool isSystemApp,  int installDate,  int updateDate,  String developer,  String apkPath,  String dataDir,  int targetSdk,  int minSdk,  int uid,  String installSource,  List<String> permissions,  List<String> requestedPermissions,  List<String> grantedPermissions,  List<String> activities,  List<String> services,  List<String> receivers,  List<String> providers,  int cacheSize,  int dataSize,  int codeSize,  int totalSize,  String sharedUserId,  bool batteryOptimizationEnabled,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _AppDetails() when $default != null:
return $default(_that.name,_that.packageName,_that.versionName,_that.versionCode,_that.isSystemApp,_that.installDate,_that.updateDate,_that.developer,_that.apkPath,_that.dataDir,_that.targetSdk,_that.minSdk,_that.uid,_that.installSource,_that.permissions,_that.requestedPermissions,_that.grantedPermissions,_that.activities,_that.services,_that.receivers,_that.providers,_that.cacheSize,_that.dataSize,_that.codeSize,_that.totalSize,_that.sharedUserId,_that.batteryOptimizationEnabled,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppDetails implements AppDetails {
  const _AppDetails({this.name = 'Unknown', this.packageName = 'Unknown', this.versionName = 'Unknown', this.versionCode = 0, this.isSystemApp = false, this.installDate = 0, this.updateDate = 0, this.developer = 'Unknown', this.apkPath = '', this.dataDir = '', this.targetSdk = 0, this.minSdk = 0, this.uid = 0, this.installSource = 'Unknown', final  List<String> permissions = const [], final  List<String> requestedPermissions = const [], final  List<String> grantedPermissions = const [], final  List<String> activities = const [], final  List<String> services = const [], final  List<String> receivers = const [], final  List<String> providers = const [], this.cacheSize = 0, this.dataSize = 0, this.codeSize = 0, this.totalSize = 0, this.sharedUserId = 'Unknown', this.batteryOptimizationEnabled = false, this.error}): _permissions = permissions,_requestedPermissions = requestedPermissions,_grantedPermissions = grantedPermissions,_activities = activities,_services = services,_receivers = receivers,_providers = providers;
  factory _AppDetails.fromJson(Map<String, dynamic> json) => _$AppDetailsFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String packageName;
@override@JsonKey() final  String versionName;
@override@JsonKey() final  int versionCode;
@override@JsonKey() final  bool isSystemApp;
@override@JsonKey() final  int installDate;
@override@JsonKey() final  int updateDate;
@override@JsonKey() final  String developer;
@override@JsonKey() final  String apkPath;
@override@JsonKey() final  String dataDir;
@override@JsonKey() final  int targetSdk;
@override@JsonKey() final  int minSdk;
@override@JsonKey() final  int uid;
@override@JsonKey() final  String installSource;
 final  List<String> _permissions;
@override@JsonKey() List<String> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}

 final  List<String> _requestedPermissions;
@override@JsonKey() List<String> get requestedPermissions {
  if (_requestedPermissions is EqualUnmodifiableListView) return _requestedPermissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requestedPermissions);
}

 final  List<String> _grantedPermissions;
@override@JsonKey() List<String> get grantedPermissions {
  if (_grantedPermissions is EqualUnmodifiableListView) return _grantedPermissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_grantedPermissions);
}

 final  List<String> _activities;
@override@JsonKey() List<String> get activities {
  if (_activities is EqualUnmodifiableListView) return _activities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activities);
}

 final  List<String> _services;
@override@JsonKey() List<String> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

 final  List<String> _receivers;
@override@JsonKey() List<String> get receivers {
  if (_receivers is EqualUnmodifiableListView) return _receivers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_receivers);
}

 final  List<String> _providers;
@override@JsonKey() List<String> get providers {
  if (_providers is EqualUnmodifiableListView) return _providers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_providers);
}

@override@JsonKey() final  int cacheSize;
@override@JsonKey() final  int dataSize;
@override@JsonKey() final  int codeSize;
@override@JsonKey() final  int totalSize;
@override@JsonKey() final  String sharedUserId;
@override@JsonKey() final  bool batteryOptimizationEnabled;
@override final  String? error;

/// Create a copy of AppDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppDetailsCopyWith<_AppDetails> get copyWith => __$AppDetailsCopyWithImpl<_AppDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppDetails&&(identical(other.name, name) || other.name == name)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.versionCode, versionCode) || other.versionCode == versionCode)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp)&&(identical(other.installDate, installDate) || other.installDate == installDate)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate)&&(identical(other.developer, developer) || other.developer == developer)&&(identical(other.apkPath, apkPath) || other.apkPath == apkPath)&&(identical(other.dataDir, dataDir) || other.dataDir == dataDir)&&(identical(other.targetSdk, targetSdk) || other.targetSdk == targetSdk)&&(identical(other.minSdk, minSdk) || other.minSdk == minSdk)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.installSource, installSource) || other.installSource == installSource)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&const DeepCollectionEquality().equals(other._requestedPermissions, _requestedPermissions)&&const DeepCollectionEquality().equals(other._grantedPermissions, _grantedPermissions)&&const DeepCollectionEquality().equals(other._activities, _activities)&&const DeepCollectionEquality().equals(other._services, _services)&&const DeepCollectionEquality().equals(other._receivers, _receivers)&&const DeepCollectionEquality().equals(other._providers, _providers)&&(identical(other.cacheSize, cacheSize) || other.cacheSize == cacheSize)&&(identical(other.dataSize, dataSize) || other.dataSize == dataSize)&&(identical(other.codeSize, codeSize) || other.codeSize == codeSize)&&(identical(other.totalSize, totalSize) || other.totalSize == totalSize)&&(identical(other.sharedUserId, sharedUserId) || other.sharedUserId == sharedUserId)&&(identical(other.batteryOptimizationEnabled, batteryOptimizationEnabled) || other.batteryOptimizationEnabled == batteryOptimizationEnabled)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,packageName,versionName,versionCode,isSystemApp,installDate,updateDate,developer,apkPath,dataDir,targetSdk,minSdk,uid,installSource,const DeepCollectionEquality().hash(_permissions),const DeepCollectionEquality().hash(_requestedPermissions),const DeepCollectionEquality().hash(_grantedPermissions),const DeepCollectionEquality().hash(_activities),const DeepCollectionEquality().hash(_services),const DeepCollectionEquality().hash(_receivers),const DeepCollectionEquality().hash(_providers),cacheSize,dataSize,codeSize,totalSize,sharedUserId,batteryOptimizationEnabled,error]);

@override
String toString() {
  return 'AppDetails(name: $name, packageName: $packageName, versionName: $versionName, versionCode: $versionCode, isSystemApp: $isSystemApp, installDate: $installDate, updateDate: $updateDate, developer: $developer, apkPath: $apkPath, dataDir: $dataDir, targetSdk: $targetSdk, minSdk: $minSdk, uid: $uid, installSource: $installSource, permissions: $permissions, requestedPermissions: $requestedPermissions, grantedPermissions: $grantedPermissions, activities: $activities, services: $services, receivers: $receivers, providers: $providers, cacheSize: $cacheSize, dataSize: $dataSize, codeSize: $codeSize, totalSize: $totalSize, sharedUserId: $sharedUserId, batteryOptimizationEnabled: $batteryOptimizationEnabled, error: $error)';
}


}

/// @nodoc
abstract mixin class _$AppDetailsCopyWith<$Res> implements $AppDetailsCopyWith<$Res> {
  factory _$AppDetailsCopyWith(_AppDetails value, $Res Function(_AppDetails) _then) = __$AppDetailsCopyWithImpl;
@override @useResult
$Res call({
 String name, String packageName, String versionName, int versionCode, bool isSystemApp, int installDate, int updateDate, String developer, String apkPath, String dataDir, int targetSdk, int minSdk, int uid, String installSource, List<String> permissions, List<String> requestedPermissions, List<String> grantedPermissions, List<String> activities, List<String> services, List<String> receivers, List<String> providers, int cacheSize, int dataSize, int codeSize, int totalSize, String sharedUserId, bool batteryOptimizationEnabled, String? error
});




}
/// @nodoc
class __$AppDetailsCopyWithImpl<$Res>
    implements _$AppDetailsCopyWith<$Res> {
  __$AppDetailsCopyWithImpl(this._self, this._then);

  final _AppDetails _self;
  final $Res Function(_AppDetails) _then;

/// Create a copy of AppDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? packageName = null,Object? versionName = null,Object? versionCode = null,Object? isSystemApp = null,Object? installDate = null,Object? updateDate = null,Object? developer = null,Object? apkPath = null,Object? dataDir = null,Object? targetSdk = null,Object? minSdk = null,Object? uid = null,Object? installSource = null,Object? permissions = null,Object? requestedPermissions = null,Object? grantedPermissions = null,Object? activities = null,Object? services = null,Object? receivers = null,Object? providers = null,Object? cacheSize = null,Object? dataSize = null,Object? codeSize = null,Object? totalSize = null,Object? sharedUserId = null,Object? batteryOptimizationEnabled = null,Object? error = freezed,}) {
  return _then(_AppDetails(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,versionName: null == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,versionCode: null == versionCode ? _self.versionCode : versionCode // ignore: cast_nullable_to_non_nullable
as int,isSystemApp: null == isSystemApp ? _self.isSystemApp : isSystemApp // ignore: cast_nullable_to_non_nullable
as bool,installDate: null == installDate ? _self.installDate : installDate // ignore: cast_nullable_to_non_nullable
as int,updateDate: null == updateDate ? _self.updateDate : updateDate // ignore: cast_nullable_to_non_nullable
as int,developer: null == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as String,apkPath: null == apkPath ? _self.apkPath : apkPath // ignore: cast_nullable_to_non_nullable
as String,dataDir: null == dataDir ? _self.dataDir : dataDir // ignore: cast_nullable_to_non_nullable
as String,targetSdk: null == targetSdk ? _self.targetSdk : targetSdk // ignore: cast_nullable_to_non_nullable
as int,minSdk: null == minSdk ? _self.minSdk : minSdk // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,installSource: null == installSource ? _self.installSource : installSource // ignore: cast_nullable_to_non_nullable
as String,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>,requestedPermissions: null == requestedPermissions ? _self._requestedPermissions : requestedPermissions // ignore: cast_nullable_to_non_nullable
as List<String>,grantedPermissions: null == grantedPermissions ? _self._grantedPermissions : grantedPermissions // ignore: cast_nullable_to_non_nullable
as List<String>,activities: null == activities ? _self._activities : activities // ignore: cast_nullable_to_non_nullable
as List<String>,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<String>,receivers: null == receivers ? _self._receivers : receivers // ignore: cast_nullable_to_non_nullable
as List<String>,providers: null == providers ? _self._providers : providers // ignore: cast_nullable_to_non_nullable
as List<String>,cacheSize: null == cacheSize ? _self.cacheSize : cacheSize // ignore: cast_nullable_to_non_nullable
as int,dataSize: null == dataSize ? _self.dataSize : dataSize // ignore: cast_nullable_to_non_nullable
as int,codeSize: null == codeSize ? _self.codeSize : codeSize // ignore: cast_nullable_to_non_nullable
as int,totalSize: null == totalSize ? _self.totalSize : totalSize // ignore: cast_nullable_to_non_nullable
as int,sharedUserId: null == sharedUserId ? _self.sharedUserId : sharedUserId // ignore: cast_nullable_to_non_nullable
as String,batteryOptimizationEnabled: null == batteryOptimizationEnabled ? _self.batteryOptimizationEnabled : batteryOptimizationEnabled // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

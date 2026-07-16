// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppInfo {

 String get name; String get packageName; bool get isSystemApp; String get versionName; int get versionCode; String get developer; int get installDate; int get updateDate; bool get enabled; bool get isRunning; int get targetSdk; int get minSdk; int get packageSize; int get dataSize; int get cacheSize; int get codeSize; int get totalSize; String get apkPath; List<String> get nativeLibraries; String get architecture; int get uid; String get installSource;
/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppInfoCopyWith<AppInfo> get copyWith => _$AppInfoCopyWithImpl<AppInfo>(this as AppInfo, _$identity);

  /// Serializes this AppInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.versionCode, versionCode) || other.versionCode == versionCode)&&(identical(other.developer, developer) || other.developer == developer)&&(identical(other.installDate, installDate) || other.installDate == installDate)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&(identical(other.targetSdk, targetSdk) || other.targetSdk == targetSdk)&&(identical(other.minSdk, minSdk) || other.minSdk == minSdk)&&(identical(other.packageSize, packageSize) || other.packageSize == packageSize)&&(identical(other.dataSize, dataSize) || other.dataSize == dataSize)&&(identical(other.cacheSize, cacheSize) || other.cacheSize == cacheSize)&&(identical(other.codeSize, codeSize) || other.codeSize == codeSize)&&(identical(other.totalSize, totalSize) || other.totalSize == totalSize)&&(identical(other.apkPath, apkPath) || other.apkPath == apkPath)&&const DeepCollectionEquality().equals(other.nativeLibraries, nativeLibraries)&&(identical(other.architecture, architecture) || other.architecture == architecture)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.installSource, installSource) || other.installSource == installSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,packageName,isSystemApp,versionName,versionCode,developer,installDate,updateDate,enabled,isRunning,targetSdk,minSdk,packageSize,dataSize,cacheSize,codeSize,totalSize,apkPath,const DeepCollectionEquality().hash(nativeLibraries),architecture,uid,installSource]);

@override
String toString() {
  return 'AppInfo(name: $name, packageName: $packageName, isSystemApp: $isSystemApp, versionName: $versionName, versionCode: $versionCode, developer: $developer, installDate: $installDate, updateDate: $updateDate, enabled: $enabled, isRunning: $isRunning, targetSdk: $targetSdk, minSdk: $minSdk, packageSize: $packageSize, dataSize: $dataSize, cacheSize: $cacheSize, codeSize: $codeSize, totalSize: $totalSize, apkPath: $apkPath, nativeLibraries: $nativeLibraries, architecture: $architecture, uid: $uid, installSource: $installSource)';
}


}

/// @nodoc
abstract mixin class $AppInfoCopyWith<$Res>  {
  factory $AppInfoCopyWith(AppInfo value, $Res Function(AppInfo) _then) = _$AppInfoCopyWithImpl;
@useResult
$Res call({
 String name, String packageName, bool isSystemApp, String versionName, int versionCode, String developer, int installDate, int updateDate, bool enabled, bool isRunning, int targetSdk, int minSdk, int packageSize, int dataSize, int cacheSize, int codeSize, int totalSize, String apkPath, List<String> nativeLibraries, String architecture, int uid, String installSource
});




}
/// @nodoc
class _$AppInfoCopyWithImpl<$Res>
    implements $AppInfoCopyWith<$Res> {
  _$AppInfoCopyWithImpl(this._self, this._then);

  final AppInfo _self;
  final $Res Function(AppInfo) _then;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? packageName = null,Object? isSystemApp = null,Object? versionName = null,Object? versionCode = null,Object? developer = null,Object? installDate = null,Object? updateDate = null,Object? enabled = null,Object? isRunning = null,Object? targetSdk = null,Object? minSdk = null,Object? packageSize = null,Object? dataSize = null,Object? cacheSize = null,Object? codeSize = null,Object? totalSize = null,Object? apkPath = null,Object? nativeLibraries = null,Object? architecture = null,Object? uid = null,Object? installSource = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,isSystemApp: null == isSystemApp ? _self.isSystemApp : isSystemApp // ignore: cast_nullable_to_non_nullable
as bool,versionName: null == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,versionCode: null == versionCode ? _self.versionCode : versionCode // ignore: cast_nullable_to_non_nullable
as int,developer: null == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as String,installDate: null == installDate ? _self.installDate : installDate // ignore: cast_nullable_to_non_nullable
as int,updateDate: null == updateDate ? _self.updateDate : updateDate // ignore: cast_nullable_to_non_nullable
as int,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,targetSdk: null == targetSdk ? _self.targetSdk : targetSdk // ignore: cast_nullable_to_non_nullable
as int,minSdk: null == minSdk ? _self.minSdk : minSdk // ignore: cast_nullable_to_non_nullable
as int,packageSize: null == packageSize ? _self.packageSize : packageSize // ignore: cast_nullable_to_non_nullable
as int,dataSize: null == dataSize ? _self.dataSize : dataSize // ignore: cast_nullable_to_non_nullable
as int,cacheSize: null == cacheSize ? _self.cacheSize : cacheSize // ignore: cast_nullable_to_non_nullable
as int,codeSize: null == codeSize ? _self.codeSize : codeSize // ignore: cast_nullable_to_non_nullable
as int,totalSize: null == totalSize ? _self.totalSize : totalSize // ignore: cast_nullable_to_non_nullable
as int,apkPath: null == apkPath ? _self.apkPath : apkPath // ignore: cast_nullable_to_non_nullable
as String,nativeLibraries: null == nativeLibraries ? _self.nativeLibraries : nativeLibraries // ignore: cast_nullable_to_non_nullable
as List<String>,architecture: null == architecture ? _self.architecture : architecture // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,installSource: null == installSource ? _self.installSource : installSource // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppInfo].
extension AppInfoPatterns on AppInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppInfo value)  $default,){
final _that = this;
switch (_that) {
case _AppInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppInfo value)?  $default,){
final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String packageName,  bool isSystemApp,  String versionName,  int versionCode,  String developer,  int installDate,  int updateDate,  bool enabled,  bool isRunning,  int targetSdk,  int minSdk,  int packageSize,  int dataSize,  int cacheSize,  int codeSize,  int totalSize,  String apkPath,  List<String> nativeLibraries,  String architecture,  int uid,  String installSource)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
return $default(_that.name,_that.packageName,_that.isSystemApp,_that.versionName,_that.versionCode,_that.developer,_that.installDate,_that.updateDate,_that.enabled,_that.isRunning,_that.targetSdk,_that.minSdk,_that.packageSize,_that.dataSize,_that.cacheSize,_that.codeSize,_that.totalSize,_that.apkPath,_that.nativeLibraries,_that.architecture,_that.uid,_that.installSource);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String packageName,  bool isSystemApp,  String versionName,  int versionCode,  String developer,  int installDate,  int updateDate,  bool enabled,  bool isRunning,  int targetSdk,  int minSdk,  int packageSize,  int dataSize,  int cacheSize,  int codeSize,  int totalSize,  String apkPath,  List<String> nativeLibraries,  String architecture,  int uid,  String installSource)  $default,) {final _that = this;
switch (_that) {
case _AppInfo():
return $default(_that.name,_that.packageName,_that.isSystemApp,_that.versionName,_that.versionCode,_that.developer,_that.installDate,_that.updateDate,_that.enabled,_that.isRunning,_that.targetSdk,_that.minSdk,_that.packageSize,_that.dataSize,_that.cacheSize,_that.codeSize,_that.totalSize,_that.apkPath,_that.nativeLibraries,_that.architecture,_that.uid,_that.installSource);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String packageName,  bool isSystemApp,  String versionName,  int versionCode,  String developer,  int installDate,  int updateDate,  bool enabled,  bool isRunning,  int targetSdk,  int minSdk,  int packageSize,  int dataSize,  int cacheSize,  int codeSize,  int totalSize,  String apkPath,  List<String> nativeLibraries,  String architecture,  int uid,  String installSource)?  $default,) {final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
return $default(_that.name,_that.packageName,_that.isSystemApp,_that.versionName,_that.versionCode,_that.developer,_that.installDate,_that.updateDate,_that.enabled,_that.isRunning,_that.targetSdk,_that.minSdk,_that.packageSize,_that.dataSize,_that.cacheSize,_that.codeSize,_that.totalSize,_that.apkPath,_that.nativeLibraries,_that.architecture,_that.uid,_that.installSource);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppInfo implements AppInfo {
  const _AppInfo({this.name = 'Unknown', this.packageName = 'Unknown', this.isSystemApp = false, this.versionName = 'Unknown', this.versionCode = 0, this.developer = 'Unknown', this.installDate = 0, this.updateDate = 0, this.enabled = true, this.isRunning = false, this.targetSdk = 0, this.minSdk = 0, this.packageSize = 0, this.dataSize = 0, this.cacheSize = 0, this.codeSize = 0, this.totalSize = 0, this.apkPath = 'Unknown', final  List<String> nativeLibraries = const [], this.architecture = 'Unknown', this.uid = 0, this.installSource = 'Unknown'}): _nativeLibraries = nativeLibraries;
  factory _AppInfo.fromJson(Map<String, dynamic> json) => _$AppInfoFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String packageName;
@override@JsonKey() final  bool isSystemApp;
@override@JsonKey() final  String versionName;
@override@JsonKey() final  int versionCode;
@override@JsonKey() final  String developer;
@override@JsonKey() final  int installDate;
@override@JsonKey() final  int updateDate;
@override@JsonKey() final  bool enabled;
@override@JsonKey() final  bool isRunning;
@override@JsonKey() final  int targetSdk;
@override@JsonKey() final  int minSdk;
@override@JsonKey() final  int packageSize;
@override@JsonKey() final  int dataSize;
@override@JsonKey() final  int cacheSize;
@override@JsonKey() final  int codeSize;
@override@JsonKey() final  int totalSize;
@override@JsonKey() final  String apkPath;
 final  List<String> _nativeLibraries;
@override@JsonKey() List<String> get nativeLibraries {
  if (_nativeLibraries is EqualUnmodifiableListView) return _nativeLibraries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nativeLibraries);
}

@override@JsonKey() final  String architecture;
@override@JsonKey() final  int uid;
@override@JsonKey() final  String installSource;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppInfoCopyWith<_AppInfo> get copyWith => __$AppInfoCopyWithImpl<_AppInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.versionCode, versionCode) || other.versionCode == versionCode)&&(identical(other.developer, developer) || other.developer == developer)&&(identical(other.installDate, installDate) || other.installDate == installDate)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&(identical(other.targetSdk, targetSdk) || other.targetSdk == targetSdk)&&(identical(other.minSdk, minSdk) || other.minSdk == minSdk)&&(identical(other.packageSize, packageSize) || other.packageSize == packageSize)&&(identical(other.dataSize, dataSize) || other.dataSize == dataSize)&&(identical(other.cacheSize, cacheSize) || other.cacheSize == cacheSize)&&(identical(other.codeSize, codeSize) || other.codeSize == codeSize)&&(identical(other.totalSize, totalSize) || other.totalSize == totalSize)&&(identical(other.apkPath, apkPath) || other.apkPath == apkPath)&&const DeepCollectionEquality().equals(other._nativeLibraries, _nativeLibraries)&&(identical(other.architecture, architecture) || other.architecture == architecture)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.installSource, installSource) || other.installSource == installSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,packageName,isSystemApp,versionName,versionCode,developer,installDate,updateDate,enabled,isRunning,targetSdk,minSdk,packageSize,dataSize,cacheSize,codeSize,totalSize,apkPath,const DeepCollectionEquality().hash(_nativeLibraries),architecture,uid,installSource]);

@override
String toString() {
  return 'AppInfo(name: $name, packageName: $packageName, isSystemApp: $isSystemApp, versionName: $versionName, versionCode: $versionCode, developer: $developer, installDate: $installDate, updateDate: $updateDate, enabled: $enabled, isRunning: $isRunning, targetSdk: $targetSdk, minSdk: $minSdk, packageSize: $packageSize, dataSize: $dataSize, cacheSize: $cacheSize, codeSize: $codeSize, totalSize: $totalSize, apkPath: $apkPath, nativeLibraries: $nativeLibraries, architecture: $architecture, uid: $uid, installSource: $installSource)';
}


}

/// @nodoc
abstract mixin class _$AppInfoCopyWith<$Res> implements $AppInfoCopyWith<$Res> {
  factory _$AppInfoCopyWith(_AppInfo value, $Res Function(_AppInfo) _then) = __$AppInfoCopyWithImpl;
@override @useResult
$Res call({
 String name, String packageName, bool isSystemApp, String versionName, int versionCode, String developer, int installDate, int updateDate, bool enabled, bool isRunning, int targetSdk, int minSdk, int packageSize, int dataSize, int cacheSize, int codeSize, int totalSize, String apkPath, List<String> nativeLibraries, String architecture, int uid, String installSource
});




}
/// @nodoc
class __$AppInfoCopyWithImpl<$Res>
    implements _$AppInfoCopyWith<$Res> {
  __$AppInfoCopyWithImpl(this._self, this._then);

  final _AppInfo _self;
  final $Res Function(_AppInfo) _then;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? packageName = null,Object? isSystemApp = null,Object? versionName = null,Object? versionCode = null,Object? developer = null,Object? installDate = null,Object? updateDate = null,Object? enabled = null,Object? isRunning = null,Object? targetSdk = null,Object? minSdk = null,Object? packageSize = null,Object? dataSize = null,Object? cacheSize = null,Object? codeSize = null,Object? totalSize = null,Object? apkPath = null,Object? nativeLibraries = null,Object? architecture = null,Object? uid = null,Object? installSource = null,}) {
  return _then(_AppInfo(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,isSystemApp: null == isSystemApp ? _self.isSystemApp : isSystemApp // ignore: cast_nullable_to_non_nullable
as bool,versionName: null == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,versionCode: null == versionCode ? _self.versionCode : versionCode // ignore: cast_nullable_to_non_nullable
as int,developer: null == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as String,installDate: null == installDate ? _self.installDate : installDate // ignore: cast_nullable_to_non_nullable
as int,updateDate: null == updateDate ? _self.updateDate : updateDate // ignore: cast_nullable_to_non_nullable
as int,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,targetSdk: null == targetSdk ? _self.targetSdk : targetSdk // ignore: cast_nullable_to_non_nullable
as int,minSdk: null == minSdk ? _self.minSdk : minSdk // ignore: cast_nullable_to_non_nullable
as int,packageSize: null == packageSize ? _self.packageSize : packageSize // ignore: cast_nullable_to_non_nullable
as int,dataSize: null == dataSize ? _self.dataSize : dataSize // ignore: cast_nullable_to_non_nullable
as int,cacheSize: null == cacheSize ? _self.cacheSize : cacheSize // ignore: cast_nullable_to_non_nullable
as int,codeSize: null == codeSize ? _self.codeSize : codeSize // ignore: cast_nullable_to_non_nullable
as int,totalSize: null == totalSize ? _self.totalSize : totalSize // ignore: cast_nullable_to_non_nullable
as int,apkPath: null == apkPath ? _self.apkPath : apkPath // ignore: cast_nullable_to_non_nullable
as String,nativeLibraries: null == nativeLibraries ? _self._nativeLibraries : nativeLibraries // ignore: cast_nullable_to_non_nullable
as List<String>,architecture: null == architecture ? _self.architecture : architecture // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,installSource: null == installSource ? _self.installSource : installSource // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

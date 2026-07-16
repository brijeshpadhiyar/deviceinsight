// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppInfo _$AppInfoFromJson(Map<String, dynamic> json) => _AppInfo(
  name: json['name'] as String? ?? 'Unknown',
  packageName: json['packageName'] as String? ?? 'Unknown',
  isSystemApp: json['isSystemApp'] as bool? ?? false,
  versionName: json['versionName'] as String? ?? 'Unknown',
  versionCode: (json['versionCode'] as num?)?.toInt() ?? 0,
  developer: json['developer'] as String? ?? 'Unknown',
  installDate: (json['installDate'] as num?)?.toInt() ?? 0,
  updateDate: (json['updateDate'] as num?)?.toInt() ?? 0,
  enabled: json['enabled'] as bool? ?? true,
  isRunning: json['isRunning'] as bool? ?? false,
  targetSdk: (json['targetSdk'] as num?)?.toInt() ?? 0,
  minSdk: (json['minSdk'] as num?)?.toInt() ?? 0,
  packageSize: (json['packageSize'] as num?)?.toInt() ?? 0,
  dataSize: (json['dataSize'] as num?)?.toInt() ?? 0,
  cacheSize: (json['cacheSize'] as num?)?.toInt() ?? 0,
  codeSize: (json['codeSize'] as num?)?.toInt() ?? 0,
  totalSize: (json['totalSize'] as num?)?.toInt() ?? 0,
  apkPath: json['apkPath'] as String? ?? 'Unknown',
  nativeLibraries:
      (json['nativeLibraries'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  architecture: json['architecture'] as String? ?? 'Unknown',
  uid: (json['uid'] as num?)?.toInt() ?? 0,
  installSource: json['installSource'] as String? ?? 'Unknown',
);

Map<String, dynamic> _$AppInfoToJson(_AppInfo instance) => <String, dynamic>{
  'name': instance.name,
  'packageName': instance.packageName,
  'isSystemApp': instance.isSystemApp,
  'versionName': instance.versionName,
  'versionCode': instance.versionCode,
  'developer': instance.developer,
  'installDate': instance.installDate,
  'updateDate': instance.updateDate,
  'enabled': instance.enabled,
  'isRunning': instance.isRunning,
  'targetSdk': instance.targetSdk,
  'minSdk': instance.minSdk,
  'packageSize': instance.packageSize,
  'dataSize': instance.dataSize,
  'cacheSize': instance.cacheSize,
  'codeSize': instance.codeSize,
  'totalSize': instance.totalSize,
  'apkPath': instance.apkPath,
  'nativeLibraries': instance.nativeLibraries,
  'architecture': instance.architecture,
  'uid': instance.uid,
  'installSource': instance.installSource,
};

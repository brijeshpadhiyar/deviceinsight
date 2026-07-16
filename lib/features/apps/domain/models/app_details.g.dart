// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppDetails _$AppDetailsFromJson(Map<String, dynamic> json) => _AppDetails(
  name: json['name'] as String? ?? 'Unknown',
  packageName: json['packageName'] as String? ?? 'Unknown',
  versionName: json['versionName'] as String? ?? 'Unknown',
  versionCode: (json['versionCode'] as num?)?.toInt() ?? 0,
  isSystemApp: json['isSystemApp'] as bool? ?? false,
  installDate: (json['installDate'] as num?)?.toInt() ?? 0,
  updateDate: (json['updateDate'] as num?)?.toInt() ?? 0,
  developer: json['developer'] as String? ?? 'Unknown',
  apkPath: json['apkPath'] as String? ?? '',
  dataDir: json['dataDir'] as String? ?? '',
  targetSdk: (json['targetSdk'] as num?)?.toInt() ?? 0,
  minSdk: (json['minSdk'] as num?)?.toInt() ?? 0,
  uid: (json['uid'] as num?)?.toInt() ?? 0,
  installSource: json['installSource'] as String? ?? 'Unknown',
  permissions:
      (json['permissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  requestedPermissions:
      (json['requestedPermissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  grantedPermissions:
      (json['grantedPermissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  activities:
      (json['activities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  services:
      (json['services'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  receivers:
      (json['receivers'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  providers:
      (json['providers'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  cacheSize: (json['cacheSize'] as num?)?.toInt() ?? 0,
  dataSize: (json['dataSize'] as num?)?.toInt() ?? 0,
  codeSize: (json['codeSize'] as num?)?.toInt() ?? 0,
  totalSize: (json['totalSize'] as num?)?.toInt() ?? 0,
  sharedUserId: json['sharedUserId'] as String? ?? 'Unknown',
  batteryOptimizationEnabled:
      json['batteryOptimizationEnabled'] as bool? ?? false,
  error: json['error'] as String?,
);

Map<String, dynamic> _$AppDetailsToJson(_AppDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'packageName': instance.packageName,
      'versionName': instance.versionName,
      'versionCode': instance.versionCode,
      'isSystemApp': instance.isSystemApp,
      'installDate': instance.installDate,
      'updateDate': instance.updateDate,
      'developer': instance.developer,
      'apkPath': instance.apkPath,
      'dataDir': instance.dataDir,
      'targetSdk': instance.targetSdk,
      'minSdk': instance.minSdk,
      'uid': instance.uid,
      'installSource': instance.installSource,
      'permissions': instance.permissions,
      'requestedPermissions': instance.requestedPermissions,
      'grantedPermissions': instance.grantedPermissions,
      'activities': instance.activities,
      'services': instance.services,
      'receivers': instance.receivers,
      'providers': instance.providers,
      'cacheSize': instance.cacheSize,
      'dataSize': instance.dataSize,
      'codeSize': instance.codeSize,
      'totalSize': instance.totalSize,
      'sharedUserId': instance.sharedUserId,
      'batteryOptimizationEnabled': instance.batteryOptimizationEnabled,
      'error': instance.error,
    };

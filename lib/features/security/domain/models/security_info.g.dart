// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SecurityInfo _$SecurityInfoFromJson(Map<String, dynamic> json) =>
    _SecurityInfo(
      isRooted: json['isRooted'] as bool? ?? false,
      isAdbEnabled: json['isAdbEnabled'] as bool? ?? false,
      isDeveloperOptionsEnabled:
          json['isDeveloperOptionsEnabled'] as bool? ?? false,
      isEncrypted: json['isEncrypted'] as bool? ?? false,
      isUnknownSourcesEnabled:
          json['isUnknownSourcesEnabled'] as bool? ?? false,
      isDeviceSecure: json['isDeviceSecure'] as bool? ?? false,
      biometricAvailable: json['biometricAvailable'] as bool? ?? false,
      seLinuxMode: json['seLinuxMode'] as String? ?? 'Unknown',
    );

Map<String, dynamic> _$SecurityInfoToJson(_SecurityInfo instance) =>
    <String, dynamic>{
      'isRooted': instance.isRooted,
      'isAdbEnabled': instance.isAdbEnabled,
      'isDeveloperOptionsEnabled': instance.isDeveloperOptionsEnabled,
      'isEncrypted': instance.isEncrypted,
      'isUnknownSourcesEnabled': instance.isUnknownSourcesEnabled,
      'isDeviceSecure': instance.isDeviceSecure,
      'biometricAvailable': instance.biometricAvailable,
      'seLinuxMode': instance.seLinuxMode,
    };

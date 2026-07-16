// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PermissionStatus _$PermissionStatusFromJson(Map<String, dynamic> json) =>
    _PermissionStatus(
      hasUsageStats: json['hasUsageStats'] as bool? ?? false,
      hasOverlay: json['hasOverlay'] as bool? ?? false,
      hasLocation: json['hasLocation'] as bool? ?? false,
      hasStorage: json['hasStorage'] as bool? ?? false,
      hasCamera: json['hasCamera'] as bool? ?? false,
      hasSensors: json['hasSensors'] as bool? ?? false,
      hasNotifications: json['hasNotifications'] as bool? ?? false,
    );

Map<String, dynamic> _$PermissionStatusToJson(_PermissionStatus instance) =>
    <String, dynamic>{
      'hasUsageStats': instance.hasUsageStats,
      'hasOverlay': instance.hasOverlay,
      'hasLocation': instance.hasLocation,
      'hasStorage': instance.hasStorage,
      'hasCamera': instance.hasCamera,
      'hasSensors': instance.hasSensors,
      'hasNotifications': instance.hasNotifications,
    };

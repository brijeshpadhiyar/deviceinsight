// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StorageStats _$StorageStatsFromJson(Map<String, dynamic> json) =>
    _StorageStats(
      totalSpace: (json['totalSpace'] as num?)?.toInt() ?? 0,
      freeSpace: (json['freeSpace'] as num?)?.toInt() ?? 0,
      usedSpace: (json['usedSpace'] as num?)?.toInt() ?? 0,
      usagePercentage: (json['usagePercentage'] as num?)?.toDouble() ?? 0.0,
      readSpeed: (json['readSpeed'] as num?)?.toDouble() ?? 0.0,
      writeSpeed: (json['writeSpeed'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$StorageStatsToJson(_StorageStats instance) =>
    <String, dynamic>{
      'totalSpace': instance.totalSpace,
      'freeSpace': instance.freeSpace,
      'usedSpace': instance.usedSpace,
      'usagePercentage': instance.usagePercentage,
      'readSpeed': instance.readSpeed,
      'writeSpeed': instance.writeSpeed,
    };

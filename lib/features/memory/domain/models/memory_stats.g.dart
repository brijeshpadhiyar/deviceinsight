// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemoryStats _$MemoryStatsFromJson(Map<String, dynamic> json) => _MemoryStats(
  totalMemory: (json['totalMemory'] as num?)?.toInt() ?? 0,
  availableMemory: (json['availableMemory'] as num?)?.toInt() ?? 0,
  usedMemory: (json['usedMemory'] as num?)?.toInt() ?? 0,
  isLowMemory: json['isLowMemory'] as bool? ?? false,
  memoryThreshold: (json['memoryThreshold'] as num?)?.toInt() ?? 0,
  memoryClass: (json['memoryClass'] as num?)?.toInt() ?? 0,
  largeMemoryClass: (json['largeMemoryClass'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$MemoryStatsToJson(_MemoryStats instance) =>
    <String, dynamic>{
      'totalMemory': instance.totalMemory,
      'availableMemory': instance.availableMemory,
      'usedMemory': instance.usedMemory,
      'isLowMemory': instance.isLowMemory,
      'memoryThreshold': instance.memoryThreshold,
      'memoryClass': instance.memoryClass,
      'largeMemoryClass': instance.largeMemoryClass,
    };

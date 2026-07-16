// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cpu_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CpuInfo _$CpuInfoFromJson(Map<String, dynamic> json) => _CpuInfo(
  overallUsage: (json['overallUsage'] as num?)?.toDouble() ?? 0.0,
  coreUsages:
      (json['coreUsages'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList() ??
      const [],
  architecture: json['architecture'] as String? ?? 'Unknown',
  coreCount: (json['coreCount'] as num?)?.toInt() ?? 0,
  frequencies:
      (json['frequencies'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
);

Map<String, dynamic> _$CpuInfoToJson(_CpuInfo instance) => <String, dynamic>{
  'overallUsage': instance.overallUsage,
  'coreUsages': instance.coreUsages,
  'architecture': instance.architecture,
  'coreCount': instance.coreCount,
  'frequencies': instance.frequencies,
};

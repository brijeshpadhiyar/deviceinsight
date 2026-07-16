// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SensorInfo _$SensorInfoFromJson(Map<String, dynamic> json) => _SensorInfo(
  name: json['name'] as String? ?? 'Unknown',
  vendor: json['vendor'] as String? ?? 'Unknown',
  version: (json['version'] as num?)?.toInt() ?? 0,
  power: (json['power'] as num?)?.toDouble() ?? 0.0,
  resolution: (json['resolution'] as num?)?.toDouble() ?? 0.0,
  maximumRange: (json['maximumRange'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$SensorInfoToJson(_SensorInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'vendor': instance.vendor,
      'version': instance.version,
      'power': instance.power,
      'resolution': instance.resolution,
      'maximumRange': instance.maximumRange,
    };

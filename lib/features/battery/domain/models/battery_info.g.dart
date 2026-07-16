// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battery_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BatteryInfo _$BatteryInfoFromJson(Map<String, dynamic> json) => _BatteryInfo(
  percentage: (json['percentage'] as num?)?.toDouble() ?? 0.0,
  isCharging: json['isCharging'] as bool? ?? false,
  status: json['status'] as String? ?? 'Unknown',
  temperature: (json['temperature'] as num?)?.toDouble() ?? 0.0,
  voltage: (json['voltage'] as num?)?.toDouble() ?? 0.0,
  health: json['health'] as String? ?? 'Unknown',
  technology: json['technology'] as String? ?? 'Unknown',
  cycleCount: (json['cycleCount'] as num?)?.toInt() ?? 0,
  capacity: (json['capacity'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$BatteryInfoToJson(_BatteryInfo instance) =>
    <String, dynamic>{
      'percentage': instance.percentage,
      'isCharging': instance.isCharging,
      'status': instance.status,
      'temperature': instance.temperature,
      'voltage': instance.voltage,
      'health': instance.health,
      'technology': instance.technology,
      'cycleCount': instance.cycleCount,
      'capacity': instance.capacity,
    };

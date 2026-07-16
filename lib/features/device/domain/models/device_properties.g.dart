// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceProperties _$DevicePropertiesFromJson(Map<String, dynamic> json) =>
    _DeviceProperties(
      board: json['board'] as String? ?? 'Unknown',
      bootloader: json['bootloader'] as String? ?? 'Unknown',
      hardware: json['hardware'] as String? ?? 'Unknown',
      device: json['device'] as String? ?? 'Unknown',
      fingerprint: json['fingerprint'] as String? ?? 'Unknown',
      host: json['host'] as String? ?? 'Unknown',
      tags: json['tags'] as String? ?? 'Unknown',
    );

Map<String, dynamic> _$DevicePropertiesToJson(_DeviceProperties instance) =>
    <String, dynamic>{
      'board': instance.board,
      'bootloader': instance.bootloader,
      'hardware': instance.hardware,
      'device': instance.device,
      'fingerprint': instance.fingerprint,
      'host': instance.host,
      'tags': instance.tags,
    };

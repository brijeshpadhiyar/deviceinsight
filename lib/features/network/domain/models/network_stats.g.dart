// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NetworkStats _$NetworkStatsFromJson(Map<String, dynamic> json) =>
    _NetworkStats(
      connectionType: json['connectionType'] as String? ?? 'Disconnected',
      ipAddress: json['ipAddress'] as String? ?? 'Unknown',
      ipv6Address: json['ipv6Address'] as String? ?? 'Unknown',
      dnsServers:
          (json['dnsServers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      macAddress: json['macAddress'] as String? ?? 'Unknown',
      bssid: json['bssid'] as String? ?? 'Unknown',
      frequency: (json['frequency'] as num?)?.toInt() ?? 0,
      downloadSpeed: (json['downloadSpeed'] as num?)?.toDouble() ?? 0.0,
      uploadSpeed: (json['uploadSpeed'] as num?)?.toDouble() ?? 0.0,
      wifiSignalStrength: (json['wifiSignalStrength'] as num?)?.toInt() ?? -1,
      pingMs: (json['pingMs'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$NetworkStatsToJson(_NetworkStats instance) =>
    <String, dynamic>{
      'connectionType': instance.connectionType,
      'ipAddress': instance.ipAddress,
      'ipv6Address': instance.ipv6Address,
      'dnsServers': instance.dnsServers,
      'macAddress': instance.macAddress,
      'bssid': instance.bssid,
      'frequency': instance.frequency,
      'downloadSpeed': instance.downloadSpeed,
      'uploadSpeed': instance.uploadSpeed,
      'wifiSignalStrength': instance.wifiSignalStrength,
      'pingMs': instance.pingMs,
    };

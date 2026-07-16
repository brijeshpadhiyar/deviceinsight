// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speed_test_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpeedTestHistory _$SpeedTestHistoryFromJson(Map<String, dynamic> json) =>
    _SpeedTestHistory(
      id: (json['id'] as num?)?.toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      downloadMbps: (json['downloadMbps'] as num).toDouble(),
      uploadMbps: (json['uploadMbps'] as num).toDouble(),
      pingMs: (json['pingMs'] as num).toInt(),
      jitterMs: (json['jitterMs'] as num).toInt(),
      serverName: json['serverName'] as String,
      networkType: json['networkType'] as String,
      connectionInfo: json['connectionInfo'] as String,
    );

Map<String, dynamic> _$SpeedTestHistoryToJson(_SpeedTestHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'downloadMbps': instance.downloadMbps,
      'uploadMbps': instance.uploadMbps,
      'pingMs': instance.pingMs,
      'jitterMs': instance.jitterMs,
      'serverName': instance.serverName,
      'networkType': instance.networkType,
      'connectionInfo': instance.connectionInfo,
    };

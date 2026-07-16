import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_stats.freezed.dart';
part 'network_stats.g.dart';

@freezed
abstract class NetworkStats with _$NetworkStats {
  const factory NetworkStats({
    @Default('Disconnected') String connectionType,
    @Default('Unknown') String ipAddress,
    @Default('Unknown') String ipv6Address,
    @Default([]) List<String> dnsServers,
    @Default('Unknown') String macAddress,
    @Default('Unknown') String bssid,
    @Default(0) int frequency,
    @Default(0.0) double downloadSpeed,
    @Default(0.0) double uploadSpeed,
    @Default(-1) int wifiSignalStrength,
    @Default(0) int pingMs,
  }) = _NetworkStats;

  factory NetworkStats.fromJson(Map<String, dynamic> json) => _$NetworkStatsFromJson(json);
}

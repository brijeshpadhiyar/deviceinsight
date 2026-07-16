import 'package:freezed_annotation/freezed_annotation.dart';

part 'speed_test_history.freezed.dart';
part 'speed_test_history.g.dart';

@freezed
abstract class SpeedTestHistory with _$SpeedTestHistory {
  const factory SpeedTestHistory({
    int? id,
    required DateTime timestamp,
    required double downloadMbps,
    required double uploadMbps,
    required int pingMs,
    required int jitterMs,
    required String serverName,
    required String networkType,
    required String connectionInfo,
  }) = _SpeedTestHistory;

  factory SpeedTestHistory.fromJson(Map<String, dynamic> json) => _$SpeedTestHistoryFromJson(json);
}

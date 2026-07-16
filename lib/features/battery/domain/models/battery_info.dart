import 'package:freezed_annotation/freezed_annotation.dart';

part 'battery_info.freezed.dart';
part 'battery_info.g.dart';

@freezed
abstract class BatteryInfo with _$BatteryInfo {
  const factory BatteryInfo({
    @Default(0.0) double percentage,
    @Default(false) bool isCharging,
    @Default('Unknown') String status,
    @Default(0.0) double temperature,
    @Default(0.0) double voltage,
    @Default('Unknown') String health,
    @Default('Unknown') String technology,
    @Default(0) int cycleCount,
    @Default(0) int capacity,
  }) = _BatteryInfo;

  factory BatteryInfo.fromJson(Map<String, dynamic> json) => _$BatteryInfoFromJson(json);
}

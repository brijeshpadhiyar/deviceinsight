import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default('Unknown') String deviceName,
    @Default('Unknown') String androidVersion,
    @Default(0.0) double batteryPercentage,
    @Default(0.0) double batteryTemperature,
    @Default(0.0) double cpuUsage,
    @Default(0.0) double ramUsage,
    @Default(0.0) double storageUsage,
    @Default(false) bool isCharging,
    
    // Health Scores
    @Default(100) int overallHealthScore,
    @Default(100) int performanceScore,
    @Default(100) int batteryScore,
    @Default(100) int storageScore,
    @Default(100) int securityScore,
    
    // Additional Live Data
    @Default(0.0) double downloadSpeed,
    @Default(0.0) double uploadSpeed,
    @Default('Disconnected') String internetStatus,
    @Default('Secure') String securityStatus,
  }) = _DashboardState;
}

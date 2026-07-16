import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_state.freezed.dart';

@freezed
abstract class DeviceState with _$DeviceState {
  const factory DeviceState({
    @Default(100.0) double batteryLevel,
    @Default(30.0) double batteryTemp,
    @Default(0.0) double usedMemoryGB,
    @Default(1.0) double totalMemoryGB,
    @Default(0.0) double usedStorageGB,
    @Default(1.0) double totalStorageGB,
    @Default(0) int unusedAppsCount,
    @Default(false) bool isRooted,
    @Default(false) bool isDeveloperOptionsEnabled,
    @Default(false) bool isUnknownSourcesEnabled,
    @Default(true) bool isScreenLockEnabled,
    @Default(0) int pingMs,
    @Default(0) int downloadMbps,
  }) = _DeviceState;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_status.freezed.dart';
part 'permission_status.g.dart';

@freezed
abstract class PermissionStatus with _$PermissionStatus {
  const factory PermissionStatus({
    @Default(false) bool hasUsageStats,
    @Default(false) bool hasOverlay,
    @Default(false) bool hasLocation,
    @Default(false) bool hasStorage,
    @Default(false) bool hasCamera,
    @Default(false) bool hasSensors,
    @Default(false) bool hasNotifications,
  }) = _PermissionStatus;

  factory PermissionStatus.fromJson(Map<String, dynamic> json) => _$PermissionStatusFromJson(json);
}

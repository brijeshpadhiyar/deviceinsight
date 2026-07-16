import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permission_service.g.dart';

abstract class IPermissionService {
  Future<bool> hasUsageStatsPermission();
  Future<void> requestUsageStatsPermission();
  Future<bool> hasOverlayPermission();
  Future<void> requestOverlayPermission();
  Future<Map<String, dynamic>> getAllPermissionsStatus();
  Future<void> openSettings(String action);
}

class PermissionServiceImpl implements IPermissionService {
  final MethodChannel _channel;
  PermissionServiceImpl(this._channel);

  @override
  Future<bool> hasUsageStatsPermission() async {
    return await _channel.invokeMethod<bool>('hasUsageStatsPermission') ??
        false;
  }

  @override
  Future<void> requestUsageStatsPermission() async {
    await _channel.invokeMethod('requestUsageStatsPermission');
  }

  @override
  Future<bool> hasOverlayPermission() async {
    return await _channel.invokeMethod<bool>('hasOverlayPermission') ?? false;
  }

  @override
  Future<void> requestOverlayPermission() async {
    await _channel.invokeMethod('requestOverlayPermission');
  }

  @override
  Future<Map<String, dynamic>> getAllPermissionsStatus() async {
    final result = await _channel.invokeMapMethod<String, dynamic>(
      'getAllPermissionsStatus',
    );
    return result ?? {};
  }

  @override
  Future<void> openSettings(String action) async {
    await _channel.invokeMethod('openSettings', {'action': action});
  }
}

@riverpod
IPermissionService permissionService(Ref ref) {
  const channel = MethodChannel('com.example.deviceinsight/native');
  return PermissionServiceImpl(channel);
}

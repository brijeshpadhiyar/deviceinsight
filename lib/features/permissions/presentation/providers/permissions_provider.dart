import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/native/permission_service.dart';
import '../../domain/models/permission_status.dart';
import 'package:permission_handler/permission_handler.dart' hide PermissionStatus;

class PermissionsStateNotifier extends AsyncNotifier<PermissionStatus> {
  @override
  Future<PermissionStatus> build() async {
    return _fetchStatus();
  }

  Future<PermissionStatus> _fetchStatus() async {
    final service = ref.read(permissionServiceProvider);
    final usage = await service.hasUsageStatsPermission();
    final overlay = await service.hasOverlayPermission();
    
    final location = await Permission.location.isGranted;
    final storage = await Permission.storage.isGranted || await Permission.manageExternalStorage.isGranted;
    final camera = await Permission.camera.isGranted;
    final sensors = await Permission.sensors.isGranted;
    final notifications = await Permission.notification.isGranted;

    return PermissionStatus(
      hasUsageStats: usage,
      hasOverlay: overlay,
      hasLocation: location,
      hasStorage: storage,
      hasCamera: camera,
      hasSensors: sensors,
      hasNotifications: notifications,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchStatus());
  }

  Future<void> requestUsageStats() async {
    final service = ref.read(permissionServiceProvider);
    await service.requestUsageStatsPermission();
  }

  Future<void> requestOverlay() async {
    final service = ref.read(permissionServiceProvider);
    await service.requestOverlayPermission();
  }
}

final permissionsStateProvider = AsyncNotifierProvider<PermissionsStateNotifier, PermissionStatus>(
  () => PermissionsStateNotifier(),
);

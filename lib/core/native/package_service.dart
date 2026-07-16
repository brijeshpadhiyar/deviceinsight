import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_service.g.dart';

abstract class IPackageService {
  Future<List<Map<String, dynamic>>> getInstalledApps();
  Future<Map<String, dynamic>> getAppDetails(String packageName);
  Future<Uint8List?> getAppIcon(String packageName);
  Future<void> uninstallApp(String packageName);
  Future<void> launchApp(String packageName);
  Future<void> openAppInfo(String packageName);
}

class PackageServiceImpl implements IPackageService {
  final MethodChannel _channel;
  PackageServiceImpl(this._channel);

  @override
  Future<List<Map<String, dynamic>>> getInstalledApps() async {
    final result = await _channel.invokeListMethod<Map<dynamic, dynamic>>(
      'getAppsInfo',
    );
    return result?.map((e) => Map<String, dynamic>.from(e)).toList() ?? [];
  }

  @override
  Future<Map<String, dynamic>> getAppDetails(String packageName) async {
    final result = await _channel.invokeMapMethod<String, dynamic>(
      'getAppDetails',
      {'packageName': packageName},
    );
    return result ?? {};
  }

  @override
  Future<Uint8List?> getAppIcon(String packageName) async {
    return await _channel.invokeMethod<Uint8List>('getAppIcon', {
      'packageName': packageName,
    });
  }

  @override
  Future<void> uninstallApp(String packageName) async {
    await _channel.invokeMethod('uninstallApp', {'packageName': packageName});
  }

  @override
  Future<void> launchApp(String packageName) async {
    await _channel.invokeMethod('launchApp', {'packageName': packageName});
  }

  @override
  Future<void> openAppInfo(String packageName) async {
    await _channel.invokeMethod('openAppInfo', {'packageName': packageName});
  }
}

@riverpod
IPackageService packageService(Ref ref) {
  const channel = MethodChannel('com.example.deviceinsight/native');
  return PackageServiceImpl(channel);
}

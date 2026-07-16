import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/device_properties.dart';

final deviceProvider = FutureProvider.autoDispose<DeviceProperties>((ref) async {
  const channel = MethodChannel('com.example.deviceinsight/native');
  final result = await channel.invokeMapMethod<String, dynamic>('getDeviceProperties');
  
  if (result != null) {
    return DeviceProperties.fromJson(result);
  }
  return const DeviceProperties();
});

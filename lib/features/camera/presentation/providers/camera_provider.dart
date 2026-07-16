import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/camera_info.dart';

final cameraProvider = FutureProvider.autoDispose<List<CameraInfo>>((ref) async {
  const channel = MethodChannel('com.example.deviceinsight/native');
  final result = await channel.invokeListMethod<Map<dynamic, dynamic>>('getCameraInfo');
  
  if (result != null) {
    return result.map((e) => CameraInfo.fromJson(Map<String, dynamic>.from(e))).toList();
  }
  return [];
});

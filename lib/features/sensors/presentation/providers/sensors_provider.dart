import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/sensor_info.dart';

final sensorsProvider = FutureProvider.autoDispose<List<SensorInfo>>((ref) async {
  const channel = MethodChannel('com.example.deviceinsight/native');
  final result = await channel.invokeListMethod<Map<dynamic, dynamic>>('getSensorsInfo');
  
  if (result != null) {
    return result.map((e) => SensorInfo.fromJson(Map<String, dynamic>.from(e))).toList();
  }
  return [];
});

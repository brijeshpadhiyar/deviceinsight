import 'dart:async';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/native/native_channel.dart';
import '../../domain/models/battery_info.dart';
import '../../domain/repositories/battery_repository.dart';

part 'battery_repository_impl.g.dart';

@riverpod
BatteryRepository batteryRepository(Ref ref) {
  final channel = ref.watch(nativeChannelProvider);
  return BatteryRepositoryImpl(channel);
}

class BatteryRepositoryImpl implements BatteryRepository {
  final MethodChannel _channel;
  static const EventChannel _eventChannel = EventChannel('com.example.deviceinsight/battery_stream');

  BatteryRepositoryImpl(this._channel);

  @override
  Future<BatteryInfo> getBatteryInfo() async {
    try {
      final result = await _channel.invokeMethod<Map<Object?, Object?>>('getBatteryInfo');
      if (result != null) {
        // Convert Map<Object?, Object?> to Map<String, dynamic>
        final map = result.map((key, value) => MapEntry(key.toString(), value));
        return BatteryInfo.fromJson(map);
      }
    } catch (e) {
      // Ignore
    }
    return const BatteryInfo();
  }

  @override
  Stream<BatteryInfo> watchBatteryInfo() {
    return _eventChannel.receiveBroadcastStream().map((event) {
      if (event is Map) {
        final map = event.map((key, value) => MapEntry(key.toString(), value));
        return BatteryInfo.fromJson(map);
      }
      return const BatteryInfo();
    });
  }
}

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/native/native_channel.dart';
import '../../domain/models/cpu_info.dart';
import '../../domain/repositories/cpu_repository.dart';

part 'cpu_repository_impl.g.dart';

@riverpod
CpuRepository cpuRepository(Ref ref) {
  final channel = ref.watch(nativeChannelProvider);
  return CpuRepositoryImpl(channel);
}

class CpuRepositoryImpl implements CpuRepository {
  final MethodChannel _channel;
  static const EventChannel _eventChannel = EventChannel('com.example.deviceinsight/cpu_stream');

  CpuRepositoryImpl(this._channel);

  @override
  Future<CpuInfo> getCpuInfo() async {
    try {
      final result = await _channel.invokeMethod<Map<Object?, Object?>>('getCpuInfo');
      if (result != null) {
        final map = result.map((key, value) => MapEntry(key.toString(), value));
        return CpuInfo.fromJson(map);
      }
    } catch (e) {
      // Ignore
    }
    return const CpuInfo();
  }

  @override
  Stream<CpuInfo> watchCpuInfo() {
    return _eventChannel.receiveBroadcastStream().map((event) {
      if (event is Map) {
        final map = event.map((key, value) => MapEntry(key.toString(), value));
        return CpuInfo.fromJson(map);
      }
      return const CpuInfo();
    });
  }
}

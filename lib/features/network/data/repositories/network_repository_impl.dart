import 'dart:async';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/native/native_channel.dart';
import '../../domain/models/network_stats.dart';
import '../../domain/repositories/network_repository.dart';

part 'network_repository_impl.g.dart';

@riverpod
NetworkRepository networkRepository(Ref ref) {
  final channel = ref.watch(nativeChannelProvider);
  return NetworkRepositoryImpl(channel);
}

class NetworkRepositoryImpl implements NetworkRepository {
  final MethodChannel _channel;
  static const EventChannel _eventChannel = EventChannel('com.example.deviceinsight/network_stream');

  NetworkRepositoryImpl(this._channel);

  @override
  Future<NetworkStats> getNetworkStats() async {
    try {
      final result = await _channel.invokeMethod<Map<Object?, Object?>>('getNetworkStats');
      if (result != null) {
        final map = result.map((key, value) => MapEntry(key.toString(), value));
        return NetworkStats.fromJson(map);
      }
    } catch (e) {
      // Ignore
    }
    return const NetworkStats();
  }

  @override
  Stream<NetworkStats> watchNetworkStats() {
    return _eventChannel.receiveBroadcastStream().map((event) {
      if (event is Map) {
        final map = event.map((key, value) => MapEntry(key.toString(), value));
        return NetworkStats.fromJson(map);
      }
      return const NetworkStats();
    });
  }
}

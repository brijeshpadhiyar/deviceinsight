import 'dart:async';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/native/native_channel.dart';
import '../../domain/models/storage_stats.dart';
import '../../domain/repositories/storage_repository.dart';

part 'storage_repository_impl.g.dart';

@riverpod
StorageRepository storageRepository(Ref ref) {
  final channel = ref.watch(nativeChannelProvider);
  return StorageRepositoryImpl(channel);
}

class StorageRepositoryImpl implements StorageRepository {
  final MethodChannel _channel;
  static const EventChannel _eventChannel = EventChannel('com.example.deviceinsight/storage_stream');

  StorageRepositoryImpl(this._channel);

  @override
  Future<StorageStats> getStorageStats() async {
    try {
      final result = await _channel.invokeMethod<Map<Object?, Object?>>('getStorageStats');
      if (result != null) {
        final map = result.map((key, value) => MapEntry(key.toString(), value));
        return StorageStats.fromJson(map);
      }
    } catch (e) {
      // Ignore
    }
    return const StorageStats();
  }

  @override
  Stream<StorageStats> watchStorageStats() {
    return _eventChannel.receiveBroadcastStream().map((event) {
      if (event is Map) {
        final map = event.map((key, value) => MapEntry(key.toString(), value));
        return StorageStats.fromJson(map);
      }
      return const StorageStats();
    });
  }
}

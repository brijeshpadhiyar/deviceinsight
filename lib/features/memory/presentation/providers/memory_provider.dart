import 'dart:async';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/memory_stats.dart';

part 'memory_provider.g.dart';

@riverpod
class MemoryNotifier extends _$MemoryNotifier {
  static const _channel = MethodChannel('com.example.deviceinsight/native');
  final List<double> _history = [];

  @override
  Stream<MemoryStats> build() async* {
    while (true) {
      try {
        final result = await _channel.invokeMapMethod<String, dynamic>('getMemoryInfo');
        if (result != null) {
          final stats = MemoryStats.fromJson(result);
          final usagePercent = stats.totalMemory > 0 
              ? (stats.usedMemory / stats.totalMemory) * 100 
              : 0.0;
          
          _history.add(usagePercent);
          if (_history.length > 30) {
            _history.removeAt(0);
          }
          yield stats;
        }
      } catch (_) {}
      await Future.delayed(const Duration(seconds: 2));
    }
  }

  List<double> get history => _history;
}

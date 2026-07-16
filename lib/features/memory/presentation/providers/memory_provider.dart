import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/memory_stats.dart';

final memoryNotifierProvider = StreamProvider.autoDispose<MemoryStats>((ref) async* {
  const channel = MethodChannel('com.example.deviceinsight/native');
  
  // Yield initial value
  try {
    final result = await channel.invokeMapMethod<String, dynamic>('getMemoryInfo');
    if (result != null) {
      yield MemoryStats.fromJson(result);
    }
  } catch (_) {}

  // Poll every 2 seconds
  bool isClosed = false;
  ref.onDispose(() => isClosed = true);
  
  while (!isClosed) {
    await Future.delayed(const Duration(seconds: 2));
    if (isClosed) break;
    try {
      final result = await channel.invokeMapMethod<String, dynamic>('getMemoryInfo');
      if (result != null) {
        yield MemoryStats.fromJson(result);
      }
    } catch (_) {}
  }
});

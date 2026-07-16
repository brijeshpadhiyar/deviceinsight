import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/display_stats.dart';

final displayProvider = FutureProvider.autoDispose<DisplayStats>((ref) async {
  const channel = MethodChannel('com.example.deviceinsight/native');
  final result = await channel.invokeMapMethod<String, dynamic>('getDisplayInfo');
  
  if (result != null) {
    return DisplayStats.fromJson(result);
  }
  return const DisplayStats(); // fallback
});

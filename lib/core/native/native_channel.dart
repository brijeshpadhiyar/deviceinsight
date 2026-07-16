import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'native_channel.g.dart';

@riverpod
MethodChannel nativeChannel(Ref ref) {
  return const MethodChannel('com.example.deviceinsight/native');
}

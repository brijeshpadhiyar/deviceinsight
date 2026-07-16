import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/security_info.dart';

final securityProvider = FutureProvider.autoDispose<SecurityInfo>((ref) async {
  const channel = MethodChannel('com.example.deviceinsight/native');
  final result = await channel.invokeMapMethod<String, dynamic>('getSecurityInfo');
  
  if (result != null) {
    return SecurityInfo.fromJson(result);
  }
  return const SecurityInfo();
});

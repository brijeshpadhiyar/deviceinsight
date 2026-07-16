import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:battery_plus/battery_plus.dart';
import 'dashboard_state.dart';

part 'dashboard_provider.g.dart';

@riverpod
class DashboardNotifier extends _$DashboardNotifier {
  static const _channel = MethodChannel('com.example.deviceinsight/native');
  Timer? _timer;
  final Battery _battery = Battery();

  @override
  DashboardState build() {
    _initDeviceData();
    _startTimer();
    
    ref.onDispose(() {
      _timer?.cancel();
    });
    
    return const DashboardState();
  }

  Future<void> _initDeviceData() async {
    final deviceInfo = DeviceInfoPlugin();
    String deviceName = 'Unknown';
    String androidVersion = 'Unknown';
    
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceName = '${androidInfo.manufacturer} ${androidInfo.model}';
      androidVersion = 'Android ${androidInfo.version.release} (API ${androidInfo.version.sdkInt})';
    }
    
    state = state.copyWith(
      deviceName: deviceName,
      androidVersion: androidVersion,
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _refreshStats();
    });
  }

  Future<void> _refreshStats() async {
    try {
      final batteryLevel = await _battery.batteryLevel;
      final batteryState = await _battery.batteryState;
      
      double batteryTemp = 0.0;
      double cpuUsage = 0.0;
      
      if (Platform.isAndroid) {
        batteryTemp = await _channel.invokeMethod<double>('getBatteryTemperature') ?? 0.0;
        cpuUsage = await _channel.invokeMethod<double>('getCpuUsage') ?? 0.0;
      }
      
      // Calculate mock scores based on simple heuristics
      int bScore = (batteryTemp < 35.0) ? 100 : (batteryTemp < 40 ? 80 : 50);
      int pScore = (cpuUsage < 50.0) ? 100 : (cpuUsage < 80 ? 75 : 40);
      int overall = ((bScore + pScore + 100 + 100) / 4).round();
      
      state = state.copyWith(
        batteryPercentage: batteryLevel.toDouble(),
        isCharging: batteryState == BatteryState.charging,
        batteryTemperature: batteryTemp,
        cpuUsage: cpuUsage,
        batteryScore: bScore,
        performanceScore: pScore,
        overallHealthScore: overall,
        ramUsage: 45.0, // Mock for now
        storageUsage: 65.0, // Mock for now
      );
    } catch (e) {
      // Ignore errors during refresh
    }
  }
}

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
      if (Platform.isAndroid) {
        // Fetch real data from native method channels
        final batteryInfo = await _channel.invokeMapMethod<String, dynamic>('getBatteryInfo');
        final cpuInfo = await _channel.invokeMapMethod<String, dynamic>('getCpuInfo');
        final memoryInfo = await _channel.invokeMapMethod<String, dynamic>('getMemoryInfo');
        final storageInfo = await _channel.invokeMapMethod<String, dynamic>('getStorageStats');
        final networkInfo = await _channel.invokeMapMethod<String, dynamic>('getNetworkStats');

        double batteryTemp = batteryInfo?['temperature'] as double? ?? 0.0;
        double batteryPct = batteryInfo?['percentage'] as double? ?? 0.0;
        bool isCharging = batteryInfo?['isCharging'] as bool? ?? false;
        
        double cpuUsage = cpuInfo?['overallUsage'] as double? ?? 0.0;
        
        double totalMemory = (memoryInfo?['totalMemory'] as num?)?.toDouble() ?? 1.0;
        double usedMemory = (memoryInfo?['usedMemory'] as num?)?.toDouble() ?? 0.0;
        double ramUsage = (usedMemory / totalMemory) * 100.0;
        
        double totalSpace = (storageInfo?['totalSpace'] as num?)?.toDouble() ?? 1.0;
        double usedSpace = (storageInfo?['usedSpace'] as num?)?.toDouble() ?? 0.0;
        double storageUsagePct = (usedSpace / totalSpace) * 100.0;
        
        double dlSpeed = (networkInfo?['downloadSpeed'] as num?)?.toDouble() ?? 0.0;
        double ulSpeed = (networkInfo?['uploadSpeed'] as num?)?.toDouble() ?? 0.0;
        String internetStatus = networkInfo?['connectionType'] as String? ?? 'Disconnected';

        // Advanced Health Score Calculations
        // Battery Score
        int bScore = 100;
        if (batteryTemp > 45) {
          bScore -= 50;
        } else if (batteryTemp > 40) {
          bScore -= 20;
        } else if (batteryTemp > 35) {
          bScore -= 5;
        }
        
        if (batteryPct < 15 && !isCharging) {
          bScore -= 15;
        }
        
        // Performance Score
        int pScore = 100;
        if (cpuUsage > 90) {
          pScore -= 40;
        } else if (cpuUsage > 75) {
          pScore -= 20;
        }
        
        if (ramUsage > 90) {
          pScore -= 30;
        } else if (ramUsage > 80) {
          pScore -= 10;
        }
        
        // Storage Score
        int sScore = 100;
        if (storageUsagePct > 95) {
          sScore -= 50;
        } else if (storageUsagePct > 90) {
          sScore -= 20;
        }
        
        // Security Score (Mocked for dashboard overview until we poll real security data)
        int secScore = 100;
        
        // Overall Health Score
        int overall = ((bScore + pScore + sScore + secScore) / 4).round();
        
        state = state.copyWith(
          batteryPercentage: batteryPct,
          isCharging: isCharging,
          batteryTemperature: batteryTemp,
          cpuUsage: cpuUsage,
          ramUsage: ramUsage,
          storageUsage: storageUsagePct,
          downloadSpeed: dlSpeed,
          uploadSpeed: ulSpeed,
          internetStatus: internetStatus,
          batteryScore: bScore.clamp(0, 100),
          performanceScore: pScore.clamp(0, 100),
          storageScore: sScore.clamp(0, 100),
          securityScore: secScore,
          overallHealthScore: overall.clamp(0, 100),
        );
      } else {
        // Fallback for non-Android platforms (if needed)
        final batteryLevel = await _battery.batteryLevel;
        final batteryState = await _battery.batteryState;
        state = state.copyWith(
          batteryPercentage: batteryLevel.toDouble(),
          isCharging: batteryState == BatteryState.charging,
        );
      }
    } catch (e) {
      // Ignore errors during refresh
    }
  }
}

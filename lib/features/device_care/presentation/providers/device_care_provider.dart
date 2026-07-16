import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/care_report.dart';
import '../../domain/models/device_state.dart';
import '../../domain/repositories/insight_provider.dart';
import '../../data/rule_based_insight_provider.dart';
import '../../../battery/presentation/providers/battery_provider.dart';
import '../../../storage/presentation/providers/storage_provider.dart';
import '../../../memory/presentation/providers/memory_provider.dart';
import '../../../security/presentation/providers/security_provider.dart';

part 'device_care_provider.g.dart';

@riverpod
InsightProvider insightEngine(Ref ref) {
  return RuleBasedInsightProvider();
}

@riverpod
Future<CareReport> deviceCare(Ref ref) async {
  final engine = ref.watch(insightEngineProvider);
  
  // Watch other modules
  final batteryAsync = ref.watch(batteryStreamProvider);
  final storageAsync = ref.watch(storageStreamProvider);
  final memoryAsync = ref.watch(memoryNotifierProvider);
  final securityAsync = ref.watch(securityProvider);
  
  // Construct DeviceState
  final state = DeviceState(
    batteryLevel: batteryAsync.value?.percentage ?? 100.0,
    batteryTemp: batteryAsync.value?.temperature ?? 30.0,
    usedMemoryGB: (memoryAsync.value?.usedMemory ?? 0) / (1024 * 1024 * 1024),
    totalMemoryGB: (memoryAsync.value?.totalMemory ?? 1) / (1024 * 1024 * 1024),
    usedStorageGB: (storageAsync.value?.usedSpace ?? 0) / (1024 * 1024 * 1024),
    totalStorageGB: (storageAsync.value?.totalSpace ?? 1) / (1024 * 1024 * 1024),
    isDeveloperOptionsEnabled: securityAsync.value?.isDeveloperOptionsEnabled ?? false,
    isUnknownSourcesEnabled: securityAsync.value?.isUnknownSourcesEnabled ?? false,
    isScreenLockEnabled: securityAsync.value?.isDeviceSecure ?? true,
    isRooted: securityAsync.value?.isRooted ?? false,
  );

  return await engine.generateInsights(state);
}

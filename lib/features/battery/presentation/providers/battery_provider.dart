import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/battery_info.dart';
import '../../data/repositories/battery_repository_impl.dart';

part 'battery_provider.g.dart';

@riverpod
Stream<BatteryInfo> batteryStream(Ref ref) {
  final repository = ref.watch(batteryRepositoryProvider);
  return repository.watchBatteryInfo();
}

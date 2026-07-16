import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/cpu_info.dart';
import '../../data/repositories/cpu_repository_impl.dart';

part 'cpu_provider.g.dart';

@riverpod
Stream<CpuInfo> cpuStream(Ref ref) {
  final repository = ref.watch(cpuRepositoryProvider);
  return repository.watchCpuInfo();
}

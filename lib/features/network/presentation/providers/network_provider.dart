import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/network_stats.dart';
import '../../data/repositories/network_repository_impl.dart';

part 'network_provider.g.dart';

@riverpod
Stream<NetworkStats> networkStream(Ref ref) {
  final repository = ref.watch(networkRepositoryProvider);
  return repository.watchNetworkStats();
}

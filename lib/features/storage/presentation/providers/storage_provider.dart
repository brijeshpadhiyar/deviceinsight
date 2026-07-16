import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/storage_stats.dart';
import '../../data/repositories/storage_repository_impl.dart';

part 'storage_provider.g.dart';

@riverpod
Stream<StorageStats> storageStream(Ref ref) {
  final repository = ref.watch(storageRepositoryProvider);
  return repository.watchStorageStats();
}

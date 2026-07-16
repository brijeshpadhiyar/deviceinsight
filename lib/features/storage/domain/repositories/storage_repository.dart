import '../models/storage_stats.dart';

abstract class StorageRepository {
  Future<StorageStats> getStorageStats();
  Stream<StorageStats> watchStorageStats();
}

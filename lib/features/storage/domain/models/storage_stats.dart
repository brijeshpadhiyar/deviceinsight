import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_stats.freezed.dart';
part 'storage_stats.g.dart';

@freezed
abstract class StorageStats with _$StorageStats {
  const factory StorageStats({
    @Default(0) int totalSpace,
    @Default(0) int freeSpace,
    @Default(0) int usedSpace,
    @Default(0.0) double usagePercentage,
    @Default(0.0) double readSpeed,
    @Default(0.0) double writeSpeed,
    // Per-category file type breakdown (in bytes)
    @Default(0) int imagesBytes,
    @Default(0) int videosBytes,
    @Default(0) int audioBytes,
    @Default(0) int documentsBytes,
    @Default(0) int appsBytes,
    @Default(0) int otherBytes,
  }) = _StorageStats;

  factory StorageStats.fromJson(Map<String, dynamic> json) =>
      _$StorageStatsFromJson(json);
}

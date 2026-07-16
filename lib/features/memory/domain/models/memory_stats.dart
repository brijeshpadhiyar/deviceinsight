import 'package:freezed_annotation/freezed_annotation.dart';

part 'memory_stats.freezed.dart';
part 'memory_stats.g.dart';

@freezed
abstract class MemoryStats with _$MemoryStats {
  const factory MemoryStats({
    @Default(0) int totalMemory,
    @Default(0) int availableMemory,
    @Default(0) int usedMemory,
    @Default(false) bool isLowMemory,
    @Default(0) int memoryThreshold,
    @Default(0) int memoryClass,
    @Default(0) int largeMemoryClass,
  }) = _MemoryStats;

  factory MemoryStats.fromJson(Map<String, dynamic> json) => _$MemoryStatsFromJson(json);
}

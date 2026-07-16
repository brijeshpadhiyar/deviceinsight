import 'package:flutter_test/flutter_test.dart';
import 'package:deviceinsight/features/storage/domain/models/storage_stats.dart';

void main() {
  group('StorageStats', () {
    test('supports value comparisons', () {
      const stats1 = StorageStats(totalSpace: 100, freeSpace: 50, usedSpace: 50, usagePercentage: 50.0);
      const stats2 = StorageStats(totalSpace: 100, freeSpace: 50, usedSpace: 50, usagePercentage: 50.0);
      expect(stats1, equals(stats2));
    });

    test('can be created from json', () {
      final json = {
        'totalSpace': 100,
        'freeSpace': 50,
        'usedSpace': 50,
        'usagePercentage': 50.0,
        'readSpeed': 0.0,
        'writeSpeed': 0.0,
      };
      final stats = StorageStats.fromJson(json);
      expect(stats.totalSpace, 100);
      expect(stats.freeSpace, 50);
      expect(stats.usedSpace, 50);
      expect(stats.usagePercentage, 50.0);
    });
  });
}

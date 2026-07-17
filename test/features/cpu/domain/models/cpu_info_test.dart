import 'package:flutter_test/flutter_test.dart';
import 'package:deviceinsight/features/cpu/domain/models/cpu_info.dart';

void main() {
  group('CpuInfo', () {
    test('supports value equality', () {
      expect(
        const CpuInfo(
          overallUsage: 50.0,
          coreUsages: [40.0, 60.0],
          architecture: 'ARM64',
          coreCount: 2,
          frequencies: [2000, 2000],
        ),
        equals(
          const CpuInfo(
            overallUsage: 50.0,
            coreUsages: [40.0, 60.0],
            architecture: 'ARM64',
            coreCount: 2,
            frequencies: [2000, 2000],
          ),
        ),
      );
    });

    test('fromJson initializes correctly', () {
      final json = {
        'overallUsage': 35.5,
        'coreUsages': [30.0, 40.0],
        'architecture': 'x86_64',
        'coreCount': 2,
        'frequencies': [1500, 1500],
      };

      final cpu = CpuInfo.fromJson(json);

      expect(cpu.overallUsage, 35.5);
      expect(cpu.architecture, 'x86_64');
      expect(cpu.coreCount, 2);
    });
  });
}

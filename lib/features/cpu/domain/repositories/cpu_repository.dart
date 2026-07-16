import '../models/cpu_info.dart';

abstract class CpuRepository {
  Future<CpuInfo> getCpuInfo();
  Stream<CpuInfo> watchCpuInfo();
}

import '../models/battery_info.dart';

abstract class BatteryRepository {
  Future<BatteryInfo> getBatteryInfo();
  Stream<BatteryInfo> watchBatteryInfo();
}

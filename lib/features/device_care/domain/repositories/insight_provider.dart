import '../models/care_report.dart';
import '../models/device_state.dart';

abstract class InsightProvider {
  Future<CareReport> generateInsights(DeviceState state);
}

import '../models/speed_test_history.dart';

abstract class SpeedTestRepository {
  /// Start the speed test and yield progress events. 
  /// The map will contain phase ('ping', 'download', 'upload') and progress value (Mbps or ms)
  Stream<Map<String, dynamic>> runSpeedTest();

  /// Save a completed test result
  Future<void> saveResult(SpeedTestHistory result);

  /// Fetch all historical results
  Future<List<SpeedTestHistory>> getHistory();

  /// Delete a specific result by ID
  Future<void> deleteResult(int id);
  
  /// Clear all history
  Future<void> clearHistory();
}

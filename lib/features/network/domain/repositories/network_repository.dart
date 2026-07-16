import '../models/network_stats.dart';

abstract class NetworkRepository {
  Future<NetworkStats> getNetworkStats();
  Stream<NetworkStats> watchNetworkStats();
}

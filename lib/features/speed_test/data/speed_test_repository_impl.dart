import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/speed_test_history.dart';
import '../domain/repositories/speed_test_repository.dart';
import 'speed_test_dao.dart';
import 'speed_test_service.dart';

final speedTestRepositoryProvider = Provider<SpeedTestRepository>((ref) {
  return SpeedTestRepositoryImpl(SpeedTestDao(), SpeedTestService());
});

class SpeedTestRepositoryImpl implements SpeedTestRepository {
  final SpeedTestDao _dao;
  final SpeedTestService _service;

  SpeedTestRepositoryImpl(this._dao, this._service);

  @override
  Stream<Map<String, dynamic>> runSpeedTest() {
    return _service.startTest();
  }

  @override
  Future<void> saveResult(SpeedTestHistory result) async {
    await _dao.insertResult(result);
  }

  @override
  Future<List<SpeedTestHistory>> getHistory() async {
    return await _dao.getAllResults();
  }

  @override
  Future<void> deleteResult(int id) async {
    await _dao.deleteResult(id);
  }

  @override
  Future<void> clearHistory() async {
    await _dao.clearAll();
  }
}

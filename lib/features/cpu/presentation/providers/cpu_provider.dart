import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/cpu_info.dart';
import '../../data/repositories/cpu_repository_impl.dart';

part 'cpu_provider.g.dart';

@riverpod
 class CpuNotifier extends _$CpuNotifier {
  final List<double> _history = [];

  @override
  Stream<CpuInfo> build() async* {
    final repo = ref.watch(cpuRepositoryProvider);
    
    await for (final info in repo.watchCpuInfo()) {
      _history.add(info.overallUsage);
      if (_history.length > 30) {
        _history.removeAt(0);
      }
      yield info;
    }
  }

  List<double> get history => _history;
}

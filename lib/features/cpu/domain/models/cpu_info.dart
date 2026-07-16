import 'package:freezed_annotation/freezed_annotation.dart';

part 'cpu_info.freezed.dart';
part 'cpu_info.g.dart';

@freezed
abstract class CpuInfo with _$CpuInfo {
  const factory CpuInfo({
    @Default(0.0) double overallUsage,
    @Default([]) List<double> coreUsages,
    @Default('Unknown') String architecture,
    @Default(0) int coreCount,
    @Default([]) List<int> frequencies,
  }) = _CpuInfo;

  factory CpuInfo.fromJson(Map<String, dynamic> json) => _$CpuInfoFromJson(json);
}

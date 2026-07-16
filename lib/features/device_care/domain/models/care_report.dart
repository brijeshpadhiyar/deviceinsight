import 'package:freezed_annotation/freezed_annotation.dart';
import 'care_recommendation.dart';

part 'care_report.freezed.dart';

@freezed
abstract class CareReport with _$CareReport {
  const factory CareReport({
    required int overallScore,
    required int securityScore,
    required int performanceScore,
    required int privacyScore,
    required List<CareRecommendation> recommendations,
  }) = _CareReport;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'care_recommendation.freezed.dart';

@freezed
abstract class CareRecommendation with _$CareRecommendation {
  const factory CareRecommendation({
    required String title,
    required String problem,
    required String solution,
    required String riskLevel,
    required String category,
    required String? actionIntent,
  }) = _CareRecommendation;
}

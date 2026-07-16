import '../domain/repositories/insight_provider.dart';
import '../domain/models/care_report.dart';
import '../domain/models/care_recommendation.dart';
import '../domain/models/device_state.dart';

class RuleBasedInsightProvider implements InsightProvider {
  @override
  Future<CareReport> generateInsights(DeviceState state) async {
    final recommendations = <CareRecommendation>[];
    int securityScore = 100;
    int performanceScore = 100;
    int privacyScore = 100;

    // Security Rules
    if (state.isDeveloperOptionsEnabled) {
      securityScore -= 10;
      recommendations.add(const CareRecommendation(
        title: 'Developer Options Enabled',
        problem: 'Your device exposes advanced debugging tools which could be exploited.',
        solution: 'Disable Developer Options unless actively debugging.',
        riskLevel: 'Medium',
        category: 'Security',
        actionIntent: 'android.settings.APPLICATION_DEVELOPMENT_SETTINGS',
      ));
    }
    
    if (state.isUnknownSourcesEnabled) {
      securityScore -= 20;
      recommendations.add(const CareRecommendation(
        title: 'Unknown Sources Allowed',
        problem: 'You have allowed apps to be installed from outside the Play Store.',
        solution: 'Disable unknown sources to prevent malware.',
        riskLevel: 'High',
        category: 'Security',
        actionIntent: 'android.settings.MANAGE_UNKNOWN_APP_SOURCES',
      ));
    }

    if (!state.isScreenLockEnabled) {
      securityScore -= 40;
      recommendations.add(const CareRecommendation(
        title: 'No Screen Lock',
        problem: 'Your device has no lock screen protection.',
        solution: 'Set a PIN, pattern, or password immediately.',
        riskLevel: 'Critical',
        category: 'Security',
        actionIntent: 'android.settings.SECURITY_SETTINGS',
      ));
    }

    // Performance & Storage
    final storageUsedPercent = state.usedStorageGB / state.totalStorageGB;
    if (storageUsedPercent > 0.9) {
      performanceScore -= 30;
      recommendations.add(const CareRecommendation(
        title: 'Storage Almost Full',
        problem: 'Your storage is over 90% full, which degrades system performance.',
        solution: 'Use the Storage Cleaner or clear app caches.',
        riskLevel: 'High',
        category: 'Storage',
        actionIntent: 'android.settings.INTERNAL_STORAGE_SETTINGS',
      ));
    }

    // Battery
    if (state.batteryTemp > 40.0) {
      performanceScore -= 20;
      recommendations.add(CareRecommendation(
        title: 'High Battery Temperature',
        problem: 'Your battery is running hot (${state.batteryTemp.toStringAsFixed(1)}°C), which degrades its lifespan.',
        solution: 'Close heavy applications or remove the device from direct sunlight.',
        riskLevel: 'Medium',
        category: 'Battery',
        actionIntent: 'android.settings.BATTERY_SAVER_SETTINGS',
      ));
    }

    int overall = ((securityScore + performanceScore + privacyScore) / 3).round();

    return CareReport(
      overallScore: overall.clamp(0, 100),
      securityScore: securityScore.clamp(0, 100),
      performanceScore: performanceScore.clamp(0, 100),
      privacyScore: privacyScore.clamp(0, 100),
      recommendations: recommendations,
    );
  }
}

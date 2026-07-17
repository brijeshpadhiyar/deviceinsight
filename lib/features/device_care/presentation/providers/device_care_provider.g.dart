// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_care_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(insightEngine)
final insightEngineProvider = InsightEngineProvider._();

final class InsightEngineProvider
    extends
        $FunctionalProvider<InsightProvider, InsightProvider, InsightProvider>
    with $Provider<InsightProvider> {
  InsightEngineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'insightEngineProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$insightEngineHash();

  @$internal
  @override
  $ProviderElement<InsightProvider> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  InsightProvider create(Ref ref) {
    return insightEngine(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InsightProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InsightProvider>(value),
    );
  }
}

String _$insightEngineHash() => r'02c07bba81a2c4d1e0c3cc843ed021e7533b2821';

@ProviderFor(deviceCare)
final deviceCareProvider = DeviceCareProvider._();

final class DeviceCareProvider
    extends
        $FunctionalProvider<
          AsyncValue<CareReport>,
          CareReport,
          FutureOr<CareReport>
        >
    with $FutureModifier<CareReport>, $FutureProvider<CareReport> {
  DeviceCareProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceCareProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceCareHash();

  @$internal
  @override
  $FutureProviderElement<CareReport> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<CareReport> create(Ref ref) {
    return deviceCare(ref);
  }
}

String _$deviceCareHash() => r'338a42b5689fbe1ec2cb4c47b83f544cd3022002';

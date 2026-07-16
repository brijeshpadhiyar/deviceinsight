// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battery_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(batteryRepository)
final batteryRepositoryProvider = BatteryRepositoryProvider._();

final class BatteryRepositoryProvider
    extends
        $FunctionalProvider<
          BatteryRepository,
          BatteryRepository,
          BatteryRepository
        >
    with $Provider<BatteryRepository> {
  BatteryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'batteryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$batteryRepositoryHash();

  @$internal
  @override
  $ProviderElement<BatteryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BatteryRepository create(Ref ref) {
    return batteryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BatteryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BatteryRepository>(value),
    );
  }
}

String _$batteryRepositoryHash() => r'7b507f37a60a3910f5023a123116f7f64dcaa536';

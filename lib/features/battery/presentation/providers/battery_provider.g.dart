// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battery_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(batteryStream)
final batteryStreamProvider = BatteryStreamProvider._();

final class BatteryStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<BatteryInfo>,
          BatteryInfo,
          Stream<BatteryInfo>
        >
    with $FutureModifier<BatteryInfo>, $StreamProvider<BatteryInfo> {
  BatteryStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'batteryStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$batteryStreamHash();

  @$internal
  @override
  $StreamProviderElement<BatteryInfo> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<BatteryInfo> create(Ref ref) {
    return batteryStream(ref);
  }
}

String _$batteryStreamHash() => r'b565085f8a515dae82dcce2c30e315880b5dea9b';

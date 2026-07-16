// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cpu_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cpuStream)
final cpuStreamProvider = CpuStreamProvider._();

final class CpuStreamProvider
    extends $FunctionalProvider<AsyncValue<CpuInfo>, CpuInfo, Stream<CpuInfo>>
    with $FutureModifier<CpuInfo>, $StreamProvider<CpuInfo> {
  CpuStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cpuStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cpuStreamHash();

  @$internal
  @override
  $StreamProviderElement<CpuInfo> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<CpuInfo> create(Ref ref) {
    return cpuStream(ref);
  }
}

String _$cpuStreamHash() => r'f14ad91320cb42f4c9bc02a58d68d7df1cd0b4ab';

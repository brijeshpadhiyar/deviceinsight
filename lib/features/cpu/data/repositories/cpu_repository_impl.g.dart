// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cpu_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cpuRepository)
final cpuRepositoryProvider = CpuRepositoryProvider._();

final class CpuRepositoryProvider
    extends $FunctionalProvider<CpuRepository, CpuRepository, CpuRepository>
    with $Provider<CpuRepository> {
  CpuRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cpuRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cpuRepositoryHash();

  @$internal
  @override
  $ProviderElement<CpuRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CpuRepository create(Ref ref) {
    return cpuRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CpuRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CpuRepository>(value),
    );
  }
}

String _$cpuRepositoryHash() => r'9315c7f7781142f90a2432833a8b3b8b4f8bd5f6';

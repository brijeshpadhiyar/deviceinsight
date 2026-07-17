// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MemoryNotifier)
final memoryProvider = MemoryNotifierProvider._();

final class MemoryNotifierProvider
    extends $StreamNotifierProvider<MemoryNotifier, MemoryStats> {
  MemoryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'memoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$memoryNotifierHash();

  @$internal
  @override
  MemoryNotifier create() => MemoryNotifier();
}

String _$memoryNotifierHash() => r'cb7dec8cc32788f5f13e86598325c64bf1cf74af';

abstract class _$MemoryNotifier extends $StreamNotifier<MemoryStats> {
  Stream<MemoryStats> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<MemoryStats>, MemoryStats>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MemoryStats>, MemoryStats>,
              AsyncValue<MemoryStats>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

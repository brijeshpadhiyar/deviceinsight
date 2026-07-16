// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storageStream)
final storageStreamProvider = StorageStreamProvider._();

final class StorageStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<StorageStats>,
          StorageStats,
          Stream<StorageStats>
        >
    with $FutureModifier<StorageStats>, $StreamProvider<StorageStats> {
  StorageStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageStreamHash();

  @$internal
  @override
  $StreamProviderElement<StorageStats> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<StorageStats> create(Ref ref) {
    return storageStream(ref);
  }
}

String _$storageStreamHash() => r'a11c35e87826f69bc2a62432fd0d94ad2f1f043e';

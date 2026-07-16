// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(networkRepository)
final networkRepositoryProvider = NetworkRepositoryProvider._();

final class NetworkRepositoryProvider
    extends
        $FunctionalProvider<
          NetworkRepository,
          NetworkRepository,
          NetworkRepository
        >
    with $Provider<NetworkRepository> {
  NetworkRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkRepositoryHash();

  @$internal
  @override
  $ProviderElement<NetworkRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NetworkRepository create(Ref ref) {
    return networkRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkRepository>(value),
    );
  }
}

String _$networkRepositoryHash() => r'c92de9048f6ae0fe21d8448dcc6e972aba43baae';

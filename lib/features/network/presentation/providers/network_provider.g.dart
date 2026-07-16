// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(networkStream)
final networkStreamProvider = NetworkStreamProvider._();

final class NetworkStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<NetworkStats>,
          NetworkStats,
          Stream<NetworkStats>
        >
    with $FutureModifier<NetworkStats>, $StreamProvider<NetworkStats> {
  NetworkStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkStreamHash();

  @$internal
  @override
  $StreamProviderElement<NetworkStats> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<NetworkStats> create(Ref ref) {
    return networkStream(ref);
  }
}

String _$networkStreamHash() => r'721ebacc43bc7a59eed7b2518c5f5e17267204ed';

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'native_channel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(nativeChannel)
final nativeChannelProvider = NativeChannelProvider._();

final class NativeChannelProvider
    extends $FunctionalProvider<MethodChannel, MethodChannel, MethodChannel>
    with $Provider<MethodChannel> {
  NativeChannelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nativeChannelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nativeChannelHash();

  @$internal
  @override
  $ProviderElement<MethodChannel> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MethodChannel create(Ref ref) {
    return nativeChannel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MethodChannel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MethodChannel>(value),
    );
  }
}

String _$nativeChannelHash() => r'f7c4414086471b20cbf163d727a2f578787a6d59';

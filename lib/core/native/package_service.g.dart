// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(packageService)
final packageServiceProvider = PackageServiceProvider._();

final class PackageServiceProvider
    extends
        $FunctionalProvider<IPackageService, IPackageService, IPackageService>
    with $Provider<IPackageService> {
  PackageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'packageServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$packageServiceHash();

  @$internal
  @override
  $ProviderElement<IPackageService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IPackageService create(Ref ref) {
    return packageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IPackageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IPackageService>(value),
    );
  }
}

String _$packageServiceHash() => r'576f6c4b8f43a3dcad64dfd1893cfe381ea15f15';

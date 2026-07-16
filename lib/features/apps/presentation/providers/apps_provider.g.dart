// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apps_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apps)
final appsProvider = AppsProvider._();

final class AppsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AppInfo>>,
          List<AppInfo>,
          FutureOr<List<AppInfo>>
        >
    with $FutureModifier<List<AppInfo>>, $FutureProvider<List<AppInfo>> {
  AppsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appsHash();

  @$internal
  @override
  $FutureProviderElement<List<AppInfo>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<AppInfo>> create(Ref ref) {
    return apps(ref);
  }
}

String _$appsHash() => r'd21c11ad3090a35e8d1d2374472997b94003f817';

@ProviderFor(appDetails)
final appDetailsProvider = AppDetailsFamily._();

final class AppDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppDetails>,
          AppDetails,
          FutureOr<AppDetails>
        >
    with $FutureModifier<AppDetails>, $FutureProvider<AppDetails> {
  AppDetailsProvider._({
    required AppDetailsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'appDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$appDetailsHash();

  @override
  String toString() {
    return r'appDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AppDetails> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AppDetails> create(Ref ref) {
    final argument = this.argument as String;
    return appDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AppDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$appDetailsHash() => r'8c7f46f36314bf694fe8d4dcaeb41bf3099becc4';

final class AppDetailsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<AppDetails>, String> {
  AppDetailsFamily._()
    : super(
        retry: null,
        name: r'appDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AppDetailsProvider call(String packageName) =>
      AppDetailsProvider._(argument: packageName, from: this);

  @override
  String toString() => r'appDetailsProvider';
}

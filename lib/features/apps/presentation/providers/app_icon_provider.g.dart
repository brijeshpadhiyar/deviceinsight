// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_icon_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppIcon)
final appIconProvider = AppIconFamily._();

final class AppIconProvider
    extends $AsyncNotifierProvider<AppIcon, Uint8List?> {
  AppIconProvider._({
    required AppIconFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'appIconProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$appIconHash();

  @override
  String toString() {
    return r'appIconProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AppIcon create() => AppIcon();

  @override
  bool operator ==(Object other) {
    return other is AppIconProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$appIconHash() => r'855a12fd03916fe39c2d9a1ed63a15d530e5fbd8';

final class AppIconFamily extends $Family
    with
        $ClassFamilyOverride<
          AppIcon,
          AsyncValue<Uint8List?>,
          Uint8List?,
          FutureOr<Uint8List?>,
          String
        > {
  AppIconFamily._()
    : super(
        retry: null,
        name: r'appIconProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AppIconProvider call(String packageName) =>
      AppIconProvider._(argument: packageName, from: this);

  @override
  String toString() => r'appIconProvider';
}

abstract class _$AppIcon extends $AsyncNotifier<Uint8List?> {
  late final _$args = ref.$arg as String;
  String get packageName => _$args;

  FutureOr<Uint8List?> build(String packageName);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Uint8List?>, Uint8List?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Uint8List?>, Uint8List?>,
              AsyncValue<Uint8List?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

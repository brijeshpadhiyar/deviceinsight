import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/native/package_service.dart';

part 'app_icon_provider.g.dart';

@riverpod
class AppIcon extends _$AppIcon {
  @override
  Future<Uint8List?> build(String packageName) async {
    final packageService = ref.watch(packageServiceProvider);
    return await packageService.getAppIcon(packageName);
  }
}

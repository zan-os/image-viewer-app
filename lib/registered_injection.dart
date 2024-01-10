import 'package:get_it/get_it.dart';
import 'package:unsplash_flutter/core/di/core_injection.dart';
import 'package:unsplash_flutter/features/image_list/di/image_list_injection.dart';

final sl = GetIt.instance;

class RegisteredInjection {
  static Future<void> init() async {
    _registerCoreInjection();
    _registerImageListInjection();
  }

  static void _registerCoreInjection() {
    CoreInjection();
  }

  static void _registerImageListInjection() {
    ImageListInjection();
  }
}

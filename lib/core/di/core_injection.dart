import 'package:dio/dio.dart';
import 'package:unsplash_flutter/config/constant_config.dart';

import '../../registered_injection.dart';

class CoreInjection {
  CoreInjection() {
    _registerCoreInjection();
    _registerConstantConfig();
  }

  void _registerConstantConfig() {
    sl.registerLazySingleton<ConstantConfig>(() => ConstantConfig());
  }

  void _registerCoreInjection() {
    const maxTimeoutDuration = Duration(seconds: 3);

    sl.registerLazySingleton(() {
      final constantConfig = ConstantConfig();
      Map<String, Object> headers = {};
      headers['Authorization'] = 'Client-ID ${constantConfig.accessKey}';
      BaseOptions options = BaseOptions(
        baseUrl: constantConfig.baseUrl,
        headers: headers,
        sendTimeout: maxTimeoutDuration,
        receiveTimeout: maxTimeoutDuration,
        connectTimeout: maxTimeoutDuration,
      );
      final dio = Dio(options);
      return dio;
    });
  }
}

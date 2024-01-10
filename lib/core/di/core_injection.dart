import 'package:dio/dio.dart';
import 'package:unsplash_flutter/config/constant_config.dart';

import '../../registered_injection.dart';

class CoreInjection {
  CoreInjection() {
    _registerCoreInjection();
  }

  void _registerCoreInjection() {
    sl.registerLazySingleton(() {
      Map<String, Object> headers = {};
      headers['Authorization'] = 'Client-ID ${ConstantConfig.accessKey}';
      BaseOptions options = BaseOptions(
        baseUrl: ConstantConfig.baseUrl,
        headers: headers,
      );
      final dio = Dio(options);
      return dio;
    });
  }
}

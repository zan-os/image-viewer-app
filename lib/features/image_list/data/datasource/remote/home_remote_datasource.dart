import 'dart:async';

import 'package:dio/dio.dart';
import 'package:unsplash_flutter/features/image_list/data/model/response/image_model.dart';

import '../../../../../config/constant_config.dart';

abstract class HomeRemoteDataSource {
  Future<List<ImageModel>> getImageList();
  Future<void> downloadImage({
    required String url,
    required ProgressCallback onReceiveProgress,
    required String savePath,
    required CancelToken cancelToken,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio _dio;
  final ConstantConfig _constantConfig;

  HomeRemoteDataSourceImpl(
      {required Dio dio, required ConstantConfig constantConfig})
      : _dio = dio,
        _constantConfig = constantConfig;

  @override
  Future<List<ImageModel>> getImageList() async {
    try {
      final response = await _dio.get('${_constantConfig.baseUrl}/photos');

      final imageList = response.data
          .map<ImageModel>((data) => ImageModel.fromJson(data))
          .toList();
      return imageList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> downloadImage({
    required String url,
    required ProgressCallback onReceiveProgress,
    required String savePath,
    required CancelToken cancelToken,
  }) async {
    try {
      await _dio.download(
        url,
        savePath,
        cancelToken: cancelToken,
        onReceiveProgress: (received, total) {
          onReceiveProgress(received, total);
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}

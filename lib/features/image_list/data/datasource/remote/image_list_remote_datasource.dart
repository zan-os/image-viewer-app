import 'package:dio/dio.dart';
import 'package:unsplash_flutter/features/image_list/data/model/response/image_model.dart';

import '../../../../../config/constant_config.dart';

abstract class ImageListRemoteDataSource {
  Future<List<ImageModel>> getImageList();
}

class ImageListRemoteDataSourceImpl implements ImageListRemoteDataSource {
  final Dio _dio;

  ImageListRemoteDataSourceImpl({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<List<ImageModel>> getImageList() async {
    try {
      final response = await _dio.get('${ConstantConfig.baseUrl}/photos');
      final imageList = response.data
          .map<ImageModel>((data) => ImageModel.fromJson(data))
          .toList();
      return imageList;
    } catch (e) {
      rethrow;
    }
  }
}

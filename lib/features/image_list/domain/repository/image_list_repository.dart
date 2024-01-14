import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:unsplash_flutter/core/failure/failure.dart';
import 'package:unsplash_flutter/features/image_list/domain/entities/image_entity.dart';

abstract class ImageListRepository {
  Future<Either<FailureResponse, List<ImageEntity>>> getImageList();
  Future<Either<FailureResponse, void>> downloadImage({
    required String url,
    required ProgressCallback onReceiveProgress,
    required String savePath,
    required CancelToken cancelToken,
  });
}

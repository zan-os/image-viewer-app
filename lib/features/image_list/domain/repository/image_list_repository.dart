import 'package:dartz/dartz.dart';
import 'package:unsplash_flutter/core/failure/failure.dart';
import 'package:unsplash_flutter/features/image_list/domain/entities/image_entity.dart';

abstract class ImageListRepository {
  Future<Either<FailureResponse, List<ImageEntity>>> getImageList();
}

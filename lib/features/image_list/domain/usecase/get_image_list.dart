import 'package:dartz/dartz.dart';
import 'package:unsplash_flutter/core/failure/failure.dart';
import 'package:unsplash_flutter/core/usecase/base_usecase.dart';
import 'package:unsplash_flutter/features/image_list/domain/entities/image_entity.dart';
import 'package:unsplash_flutter/features/image_list/domain/repository/home_repository.dart';

class GetImageList extends BaseUseCase<List<ImageEntity>, NoParams> {
  final HomeRepository _repository;

  GetImageList({required HomeRepository repository}) : _repository = repository;

  @override
  Future<Either<FailureResponse, List<ImageEntity>>> call(NoParams params) =>
      _repository.getImageList();
}

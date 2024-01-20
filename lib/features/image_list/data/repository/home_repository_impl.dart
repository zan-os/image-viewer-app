import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:unsplash_flutter/core/failure/failure.dart';
import 'package:unsplash_flutter/features/image_list/data/datasource/remote/home_remote_datasource.dart';
import 'package:unsplash_flutter/features/image_list/data/model/mapper/image_mapper.dart';
import 'package:unsplash_flutter/features/image_list/domain/entities/image_entity.dart';
import 'package:unsplash_flutter/features/image_list/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;
  final ImageMapper _mapper;

  HomeRepositoryImpl(
      {required HomeRemoteDataSource remoteDataSource,
      required ImageMapper mapper})
      : _remoteDataSource = remoteDataSource,
        _mapper = mapper;

  @override
  Future<Either<FailureResponse, List<ImageEntity>>> getImageList() async {
    try {
      final response = await _remoteDataSource.getImageList();
      final imageList = response
          .map(
            (data) => _mapper.toEntity(data),
          )
          .toList();
      return Right(imageList);
    } on DioException catch (e) {
      return Left(
        FailureResponse(
          message: e.message,
          statusCode: e.response?.statusCode,
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, void>> downloadImage({
    required String url,
    required ProgressCallback onReceiveProgress,
    required String savePath,
    required CancelToken cancelToken,
  }) async {
    try {
      final downloadProgress = await _remoteDataSource.downloadImage(
        url: url,
        onReceiveProgress: onReceiveProgress,
        savePath: savePath,
        cancelToken: cancelToken,
      );

      return Right(downloadProgress);
    } on DioException catch (e) {
      return Left(
        FailureResponse(
          message: e.message,
          statusCode: e.response?.statusCode,
        ),
      );
    }
  }
}

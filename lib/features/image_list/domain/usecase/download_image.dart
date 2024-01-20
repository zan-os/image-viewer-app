// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:unsplash_flutter/core/failure/failure.dart';
import 'package:unsplash_flutter/core/usecase/base_usecase.dart';
import 'package:unsplash_flutter/features/image_list/domain/repository/home_repository.dart';

class DownloadImage extends BaseUseCase<void, DownloadImageParams> {
  final HomeRepository _repository;

  DownloadImage({required HomeRepository repository})
      : _repository = repository;

  @override
  Future<Either<FailureResponse, void>> call(
          DownloadImageParams params) async =>
      _repository.downloadImage(
        url: params.url,
        savePath: params.savePath,
        cancelToken: params.cancelToken,
        onReceiveProgress: (received, total) {
          params.onReceiveProgress(received, total);
        },
      );
}

class DownloadImageParams {
  final String url;
  final String savePath;
  final CancelToken cancelToken;
  final void Function(int received, int total) onReceiveProgress;

  DownloadImageParams({
    required this.url,
    required this.savePath,
    required this.cancelToken,
    required this.onReceiveProgress,
  });
}

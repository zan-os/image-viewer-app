import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unsplash_flutter/core/usecase/base_usecase.dart';
import 'package:unsplash_flutter/features/image_list/domain/usecase/download_image.dart';
import 'package:unsplash_flutter/features/image_list/domain/usecase/get_image_list.dart';
import 'package:unsplash_flutter/features/image_list/presentation/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetImageList getImageListUseCase,
    required DownloadImage downloadImageUseCase,
  })  : _getImageListUseCase = getImageListUseCase,
        _downloadImageUseCase = downloadImageUseCase,
        super(HomeState(cancelToken: CancelToken()));

  final GetImageList _getImageListUseCase;
  final DownloadImage _downloadImageUseCase;

  void getImageList() async {
    final fetchResult = await _getImageListUseCase.call(NoParams());

    fetchResult.fold(
      (failure) {
        log('Ojan Error ${failure.message}');
      },
      (result) {
        emit(state.copyWith(imageList: result));
      },
    );
  }

  Future<String> _getSavePath() async {
    final savePath =
        '${(await getTemporaryDirectory()).path}downloaded-image.jpg';
    return savePath;
  }

  void _calculatePercentage(int received, int total) {
    final progress = (received / total * 100).toStringAsFixed(0);
    emit(state.copyWith(progress: int.parse(progress)));
  }

  void downloadImage({required String url, required String imageId}) async {
    if (state.cancelToken.isCancelled) {
      emit(state.copyWith(cancelToken: CancelToken()));
    }

    emit(state.copyWith(progress: 0));

    final savePath = await _getSavePath();
    final cancelToken = state.cancelToken;

    final params = DownloadImageParams(
      url: url,
      savePath: savePath,
      cancelToken: cancelToken,
      onReceiveProgress: (received, total) async {
        _calculatePercentage(received, total);
        changeValue(imageId: imageId);

        if (state.progress == 100) {
          await Future.delayed(const Duration(seconds: 1));
          clearDownloadStatus(imageId: imageId);
        }
      },
    );

    final downloadResult = await _downloadImageUseCase.call(params);

    downloadResult.fold((failure) {
      cancelDownload();

      clearDownloadStatus(imageId: imageId);
    }, (result) => null);
  }

  void cancelDownload() {
    final cancelToken = state.cancelToken;

    cancelToken.cancel('Cancelled by user');
  }

  void changeValue({required String imageId}) {
    try {
      final currentList = state.imageList;
      final updatedList = currentList.map((image) {
        if (image.id == imageId) {
          return image.copyWith(
            downloadProgress: state.progress / 100,
            downloading: true,
          );
        } else {
          return image;
        }
      }).toList();

      emit(state.copyWith(imageList: updatedList));
    } catch (e) {
      log('Ojan Error ==> $e');
    }
  }

  void clearDownloadStatus({required String imageId}) {
    try {
      final currentList = state.imageList;
      final updatedList = currentList.map((image) {
        if (image.id == imageId) {
          return image.copyWith(
            downloadProgress: 0,
            downloading: false,
          );
        } else {
          return image;
        }
      }).toList();

      emit(state.copyWith(imageList: updatedList));
    } catch (e) {
      log('Ojan Error ==> $e');
    }
  }
}

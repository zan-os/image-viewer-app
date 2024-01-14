// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/image_entity.dart';

class ImageListState extends Equatable {
  final List<ImageEntity> imageList;
  final int progress;
  final String message;
  final CancelToken cancelToken;

  const ImageListState({
    this.imageList = const [],
    this.progress = 0,
    this.message = '',
    required this.cancelToken,
  });

  ImageListState copyWith({
    List<ImageEntity>? imageList,
    int? progress,
    String? message,
    CancelToken? cancelToken,
  }) {
    return ImageListState(
      imageList: imageList ?? this.imageList,
      progress: progress ?? this.progress,
      message: message ?? this.message,
      cancelToken: cancelToken ?? this.cancelToken,
    );
  }

  @override
  List<Object> get props => [imageList, progress, message, cancelToken];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../domain/entities/image_entity.dart';

abstract class ImageListState extends Equatable {}

class InitState extends ImageListState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends ImageListState {
  @override
  List<Object?> get props => [];
}

class SuccessState extends ImageListState {
  final List<ImageEntity> imageList;

  SuccessState({
    this.imageList = const [],
  });

  @override
  List<Object?> get props => [imageList];

  SuccessState copyWith({
    List<ImageEntity>? imageList,
  }) {
    return SuccessState(
      imageList: imageList ?? this.imageList,
    );
  }
}

class ErrorState extends ImageListState {
  final String message;

  ErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_flutter/core/usecase/base_usecase.dart';
import 'package:unsplash_flutter/features/image_list/domain/usecase/get_image_list_usecase.dart';
import 'package:unsplash_flutter/features/image_list/presentation/bloc/image_list_state.dart';

class ImageListCubit extends Cubit<ImageListState> {
  ImageListCubit({
    required GetImageListUseCase getImageListUseCase,
  })  : _getImageListUseCase = getImageListUseCase,
        super(InitState());

  final GetImageListUseCase _getImageListUseCase;

  void getImageList() async {
    emit(LoadingState());

    await Future.delayed(const Duration(
      seconds: 1,
    ));

    final fetchResult = await _getImageListUseCase.call(NoParams());

    fetchResult.fold(
      (failure) => emit(ErrorState(message: failure.message ?? '')),
      (result) => emit(SuccessState(imageList: result)),
    );
  }
}

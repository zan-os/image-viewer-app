import 'package:unsplash_flutter/features/image_list/data/datasource/remote/home_remote_datasource.dart';
import 'package:unsplash_flutter/features/image_list/data/model/mapper/image_mapper.dart';
import 'package:unsplash_flutter/features/image_list/data/repository/home_repository_impl.dart';
import 'package:unsplash_flutter/features/image_list/domain/repository/home_repository.dart';
import 'package:unsplash_flutter/features/image_list/domain/usecase/download_image.dart';
import 'package:unsplash_flutter/features/image_list/domain/usecase/get_image_list.dart';
import 'package:unsplash_flutter/features/image_list/presentation/bloc/home_cubit.dart';

import '../../../registered_injection.dart';

class HomeInjection {
  HomeInjection() {
    _registerCubit();
    _registerDataSource();
    _registerMapper();
    _registerRepository();
    _registerUseCase();
  }

  _registerCubit() {
    sl.registerLazySingleton(
      () => HomeCubit(
        getImageListUseCase: sl(),
        downloadImageUseCase: sl(),
      ),
    );
  }

  _registerDataSource() {
    sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(dio: sl(), constantConfig: sl()),
    );
  }

  _registerMapper() {
    sl.registerLazySingleton<ImageMapper>(
      () => ImageMapper(),
    );
  }

  _registerRepository() {
    sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: sl(), mapper: sl()),
    );
  }

  _registerUseCase() {
    sl.registerLazySingleton<GetImageList>(
      () => GetImageList(repository: sl()),
    );

    sl.registerLazySingleton<DownloadImage>(
      () => DownloadImage(repository: sl()),
    );
  }
}

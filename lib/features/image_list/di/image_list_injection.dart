import 'package:unsplash_flutter/features/image_list/data/datasource/remote/image_list_remote_datasource.dart';
import 'package:unsplash_flutter/features/image_list/data/model/mapper/image_mapper.dart';
import 'package:unsplash_flutter/features/image_list/data/repository/image_list_repository_impl.dart';
import 'package:unsplash_flutter/features/image_list/domain/repository/image_list_repository.dart';
import 'package:unsplash_flutter/features/image_list/domain/usecase/get_image_list_usecase.dart';

import '../../../registered_injection.dart';

class ImageListInjection {
  ImageListInjection() {
    _registerDataSource();
    _registerMapper();
    _registerRepository();
    _registerUseCase();
  }

  _registerDataSource() {
    sl.registerLazySingleton<ImageListRemoteDataSource>(
      () => ImageListRemoteDataSourceImpl(dio: sl()),
    );
  }

  _registerMapper() {
    sl.registerLazySingleton<ImageMapper>(
      () => ImageMapper(),
    );
  }

  _registerRepository() {
    sl.registerLazySingleton<ImageListRepository>(
      () => ImageListRepositoryImpl(remoteDataSource: sl(), mapper: sl()),
    );
  }

  _registerUseCase() {
    sl.registerLazySingleton<GetImageListUseCase>(
      () => GetImageListUseCase(repository: sl()),
    );
  }
}

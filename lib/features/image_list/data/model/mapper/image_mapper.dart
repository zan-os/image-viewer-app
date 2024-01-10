import 'package:unsplash_flutter/features/image_list/data/model/response/image_model.dart';
import 'package:unsplash_flutter/features/image_list/domain/entities/image_entity.dart';

class ImageMapper {
  ImageEntity toEntity(ImageModel response) => ImageEntity(
        id: response.id ?? '',
        likes: response.likes ?? 0,
        likedByUser: response.likedByUser ?? false,
        user: response.user?.name ?? '',
        url: response.urls?.thumb ?? '',
      );
}

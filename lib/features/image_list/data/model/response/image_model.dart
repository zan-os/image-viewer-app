import 'package:freezed_annotation/freezed_annotation.dart';

import 'links.dart';
import 'sponsorship.dart';
import 'urls.dart';
import 'user.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
class ImageModel with _$ImageModel {
  factory ImageModel({
    String? id,
    String? slug,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'promoted_at') String? promotedAt,
    int? width,
    int? height,
    String? color,
    @JsonKey(name: 'blur_hash') String? blurHash,
    String? description,
    @JsonKey(name: 'alt_description') String? altDescription,
    List<dynamic>? breadcrumbs,
    Urls? urls,
    Links? links,
    int? likes,
    @JsonKey(name: 'liked_by_user') bool? likedByUser,
    @JsonKey(name: 'current_user_collections')
    List<dynamic>? currentUserCollections,
    Sponsorship? sponsorship,
    User? user,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}

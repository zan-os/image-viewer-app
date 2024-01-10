import 'package:freezed_annotation/freezed_annotation.dart';

import 'links.dart';
import 'profile_image.dart';
import 'social.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
	factory User({
		String? id,
		@JsonKey(name: 'updated_at') String? updatedAt,
		String? username,
		String? name,
		@JsonKey(name: 'first_name') String? firstName,
		@JsonKey(name: 'last_name') dynamic lastName,
		@JsonKey(name: 'twitter_username') String? twitterUsername,
		@JsonKey(name: 'portfolio_url') String? portfolioUrl,
		String? bio,
		String? location,
		Links? links,
		@JsonKey(name: 'profile_image') ProfileImage? profileImage,
		@JsonKey(name: 'instagram_username') String? instagramUsername,
		@JsonKey(name: 'total_collections') int? totalCollections,
		@JsonKey(name: 'total_likes') int? totalLikes,
		@JsonKey(name: 'total_photos') int? totalPhotos,
		@JsonKey(name: 'total_promoted_photos') int? totalPromotedPhotos,
		@JsonKey(name: 'accepted_tos') bool? acceptedTos,
		@JsonKey(name: 'for_hire') bool? forHire,
		Social? social,
	}) = _User;

	factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'social.freezed.dart';
part 'social.g.dart';

@freezed
class Social with _$Social {
	factory Social({
		@JsonKey(name: 'instagram_username') String? instagramUsername,
		@JsonKey(name: 'portfolio_url') String? portfolioUrl,
		@JsonKey(name: 'twitter_username') String? twitterUsername,
		@JsonKey(name: 'paypal_email') dynamic paypalEmail,
	}) = _Social;

	factory Social.fromJson(Map<String, dynamic> json) => _$SocialFromJson(json);
}
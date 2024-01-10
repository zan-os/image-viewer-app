import 'package:freezed_annotation/freezed_annotation.dart';

import 'sponsor.dart';

part 'sponsorship.freezed.dart';
part 'sponsorship.g.dart';

@freezed
class Sponsorship with _$Sponsorship {
	factory Sponsorship({
		@JsonKey(name: 'impression_urls') List<String>? impressionUrls,
		String? tagline,
		@JsonKey(name: 'tagline_url') String? taglineUrl,
		Sponsor? sponsor,
	}) = _Sponsorship;

	factory Sponsorship.fromJson(Map<String, dynamic> json) => _$SponsorshipFromJson(json);
}
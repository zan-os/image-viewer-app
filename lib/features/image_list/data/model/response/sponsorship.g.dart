// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsorship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SponsorshipImpl _$$SponsorshipImplFromJson(Map<String, dynamic> json) =>
    _$SponsorshipImpl(
      impressionUrls: (json['impression_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tagline: json['tagline'] as String?,
      taglineUrl: json['tagline_url'] as String?,
      sponsor: json['sponsor'] == null
          ? null
          : Sponsor.fromJson(json['sponsor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SponsorshipImplToJson(_$SponsorshipImpl instance) =>
    <String, dynamic>{
      'impression_urls': instance.impressionUrls,
      'tagline': instance.tagline,
      'tagline_url': instance.taglineUrl,
      'sponsor': instance.sponsor,
    };

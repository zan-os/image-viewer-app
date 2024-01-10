// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sponsorship.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Sponsorship _$SponsorshipFromJson(Map<String, dynamic> json) {
  return _Sponsorship.fromJson(json);
}

/// @nodoc
mixin _$Sponsorship {
  @JsonKey(name: 'impression_urls')
  List<String>? get impressionUrls => throw _privateConstructorUsedError;
  String? get tagline => throw _privateConstructorUsedError;
  @JsonKey(name: 'tagline_url')
  String? get taglineUrl => throw _privateConstructorUsedError;
  Sponsor? get sponsor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SponsorshipCopyWith<Sponsorship> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SponsorshipCopyWith<$Res> {
  factory $SponsorshipCopyWith(
          Sponsorship value, $Res Function(Sponsorship) then) =
      _$SponsorshipCopyWithImpl<$Res, Sponsorship>;
  @useResult
  $Res call(
      {@JsonKey(name: 'impression_urls') List<String>? impressionUrls,
      String? tagline,
      @JsonKey(name: 'tagline_url') String? taglineUrl,
      Sponsor? sponsor});

  $SponsorCopyWith<$Res>? get sponsor;
}

/// @nodoc
class _$SponsorshipCopyWithImpl<$Res, $Val extends Sponsorship>
    implements $SponsorshipCopyWith<$Res> {
  _$SponsorshipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? impressionUrls = freezed,
    Object? tagline = freezed,
    Object? taglineUrl = freezed,
    Object? sponsor = freezed,
  }) {
    return _then(_value.copyWith(
      impressionUrls: freezed == impressionUrls
          ? _value.impressionUrls
          : impressionUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      taglineUrl: freezed == taglineUrl
          ? _value.taglineUrl
          : taglineUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sponsor: freezed == sponsor
          ? _value.sponsor
          : sponsor // ignore: cast_nullable_to_non_nullable
              as Sponsor?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SponsorCopyWith<$Res>? get sponsor {
    if (_value.sponsor == null) {
      return null;
    }

    return $SponsorCopyWith<$Res>(_value.sponsor!, (value) {
      return _then(_value.copyWith(sponsor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SponsorshipImplCopyWith<$Res>
    implements $SponsorshipCopyWith<$Res> {
  factory _$$SponsorshipImplCopyWith(
          _$SponsorshipImpl value, $Res Function(_$SponsorshipImpl) then) =
      __$$SponsorshipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'impression_urls') List<String>? impressionUrls,
      String? tagline,
      @JsonKey(name: 'tagline_url') String? taglineUrl,
      Sponsor? sponsor});

  @override
  $SponsorCopyWith<$Res>? get sponsor;
}

/// @nodoc
class __$$SponsorshipImplCopyWithImpl<$Res>
    extends _$SponsorshipCopyWithImpl<$Res, _$SponsorshipImpl>
    implements _$$SponsorshipImplCopyWith<$Res> {
  __$$SponsorshipImplCopyWithImpl(
      _$SponsorshipImpl _value, $Res Function(_$SponsorshipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? impressionUrls = freezed,
    Object? tagline = freezed,
    Object? taglineUrl = freezed,
    Object? sponsor = freezed,
  }) {
    return _then(_$SponsorshipImpl(
      impressionUrls: freezed == impressionUrls
          ? _value._impressionUrls
          : impressionUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      taglineUrl: freezed == taglineUrl
          ? _value.taglineUrl
          : taglineUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sponsor: freezed == sponsor
          ? _value.sponsor
          : sponsor // ignore: cast_nullable_to_non_nullable
              as Sponsor?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SponsorshipImpl implements _Sponsorship {
  _$SponsorshipImpl(
      {@JsonKey(name: 'impression_urls') final List<String>? impressionUrls,
      this.tagline,
      @JsonKey(name: 'tagline_url') this.taglineUrl,
      this.sponsor})
      : _impressionUrls = impressionUrls;

  factory _$SponsorshipImpl.fromJson(Map<String, dynamic> json) =>
      _$$SponsorshipImplFromJson(json);

  final List<String>? _impressionUrls;
  @override
  @JsonKey(name: 'impression_urls')
  List<String>? get impressionUrls {
    final value = _impressionUrls;
    if (value == null) return null;
    if (_impressionUrls is EqualUnmodifiableListView) return _impressionUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? tagline;
  @override
  @JsonKey(name: 'tagline_url')
  final String? taglineUrl;
  @override
  final Sponsor? sponsor;

  @override
  String toString() {
    return 'Sponsorship(impressionUrls: $impressionUrls, tagline: $tagline, taglineUrl: $taglineUrl, sponsor: $sponsor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SponsorshipImpl &&
            const DeepCollectionEquality()
                .equals(other._impressionUrls, _impressionUrls) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
            (identical(other.taglineUrl, taglineUrl) ||
                other.taglineUrl == taglineUrl) &&
            (identical(other.sponsor, sponsor) || other.sponsor == sponsor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_impressionUrls),
      tagline,
      taglineUrl,
      sponsor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SponsorshipImplCopyWith<_$SponsorshipImpl> get copyWith =>
      __$$SponsorshipImplCopyWithImpl<_$SponsorshipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SponsorshipImplToJson(
      this,
    );
  }
}

abstract class _Sponsorship implements Sponsorship {
  factory _Sponsorship(
      {@JsonKey(name: 'impression_urls') final List<String>? impressionUrls,
      final String? tagline,
      @JsonKey(name: 'tagline_url') final String? taglineUrl,
      final Sponsor? sponsor}) = _$SponsorshipImpl;

  factory _Sponsorship.fromJson(Map<String, dynamic> json) =
      _$SponsorshipImpl.fromJson;

  @override
  @JsonKey(name: 'impression_urls')
  List<String>? get impressionUrls;
  @override
  String? get tagline;
  @override
  @JsonKey(name: 'tagline_url')
  String? get taglineUrl;
  @override
  Sponsor? get sponsor;
  @override
  @JsonKey(ignore: true)
  _$$SponsorshipImplCopyWith<_$SponsorshipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

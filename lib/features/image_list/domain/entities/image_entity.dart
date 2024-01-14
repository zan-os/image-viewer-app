// ignore_for_file: public_member_api_docs, sort_constructors_first
class ImageEntity {
  final String id;
  final int likes;
  final bool likedByUser;
  final String user;
  final String url;
  final String rawImageUrl;
  final bool downloading;
  final double downloadProgress;

  ImageEntity({
    required this.id,
    required this.likes,
    required this.likedByUser,
    required this.user,
    required this.url,
    this.rawImageUrl = '',
    this.downloading = false,
    this.downloadProgress = 0,
  });

  ImageEntity copyWith({
    String? id,
    int? likes,
    bool? likedByUser,
    String? user,
    String? url,
    String? rawImageUrl,
    bool? downloading,
    double? downloadProgress,
  }) {
    return ImageEntity(
      id: id ?? this.id,
      likes: likes ?? this.likes,
      likedByUser: likedByUser ?? this.likedByUser,
      user: user ?? this.user,
      url: url ?? this.url,
      rawImageUrl: rawImageUrl ?? this.rawImageUrl,
      downloading: downloading ?? this.downloading,
      downloadProgress: downloadProgress ?? this.downloadProgress,
    );
  }
}

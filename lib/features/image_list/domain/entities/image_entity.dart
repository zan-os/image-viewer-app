class ImageEntity {
  final String id;
  final int likes;
  final bool likedByUser;
  final String user;
  final String url;

  ImageEntity({
    required this.id,
    required this.likes,
    required this.likedByUser,
    required this.user,
    required this.url,
  });
}

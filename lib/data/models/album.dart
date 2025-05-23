import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  final int userId;
  final int id;
  final String title;
  final String? thumbnailUrl;

  Album({
    required this.userId,
    required this.id,
    required this.title,
    this.thumbnailUrl,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}

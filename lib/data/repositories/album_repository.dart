import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/album.dart';
import '../models/photo.dart';
import '../services/api_service.dart';

class AlbumRepository {
  final ApiService apiService;

  AlbumRepository(this.apiService);

  Future<List<Album>> fetchAlbums() async {
    final albums = await apiService.fetchAlbums();
    final List<Album> enrichedAlbums = [];
    for (var album in albums) {
      final photos = await apiService.fetchPhotos(album.id);
      enrichedAlbums.add(Album(
        id: album.id,
        userId: album.userId,
        title: album.title,
        thumbnailUrl: photos.isNotEmpty ? photos.first.thumbnailUrl : null,
      ));
    }
    return enrichedAlbums;
  }

  Future<List<Photo>> fetchPhotos(int albumId) async {
    final photos = await apiService.fetchPhotos(albumId);
    return photos;
  }
}
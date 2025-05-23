import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/album.dart';
import '../models/photo.dart';

class ApiService {
  Future<List<Album>> fetchAlbums() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Album.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch albums');
    }
  }

  Future<List<Photo>> fetchPhotos(int albumId) async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos?albumId=$albumId'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch photos');
    }
  }
}
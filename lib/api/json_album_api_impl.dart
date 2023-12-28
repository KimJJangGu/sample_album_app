import 'dart:convert';
import 'package:album_app/api/album_api.dart';
import '../model/album.dart';
import '../model/photo.dart';
import 'package:http/http.dart' as http;

class JsonAlbumApiImpl implements AlbumApi {
  @override
  Future<Album> getAlbum() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    return Album.fromJson(jsonDecode(response.body));
  }

  Future<Photo> getPhoto() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    return Photo.fromJson(jsonDecode(response.body));
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/album.dart';

class AlbumApi {
  Future<Album> getAlbum() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    return Album.fromJson(jsonDecode(response.body));
  }
}
import 'dart:convert';
import 'package:album_app/api/album_api.dart';
import '../dto/album_dto.dart';
import '../dto/photo_dto.dart';
import 'package:http/http.dart' as http;

class JsonAlbumApiImpl implements AlbumApi {
  @override
  Future<List<AlbumDto>> getAlbum() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    final jsonList = jsonDecode(response.body) as List<dynamic>;
    return jsonList.map((e) => AlbumDto.fromJson(e)).toList();
  }

  Future<List<PhotoDto>> getPhoto() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    final jsonList = jsonDecode(response.body) as List<dynamic>;
    return jsonList.map((e) => PhotoDto.fromJson(e)).toList();
  }
}

void main() async {
  final AlbumApi api = JsonAlbumApiImpl(); //
  final List<AlbumDto> albumList = await api.getAlbum();

  print(albumList);

  final AlbumApi papi = JsonAlbumApiImpl();
  final List<PhotoDto> photoList = await api.getPhoto();

  print(photoList);
}
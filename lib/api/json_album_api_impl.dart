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

  Future<List<PhotoDto>> getPhoto(String albumId) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos?albumId=$albumId'));
    final jsonList = jsonDecode(response.body) as List<dynamic>;
    return jsonList.map((e) => PhotoDto.fromJson(e)).toList();
  }
}

// api 호출이 잘 되는지 테스트
// void main() async {
//   final AlbumApi api = JsonAlbumApiImpl();
//   final List<AlbumDto> albumList = await api.getAlbum();
//
//   print(albumList);
//
//   final AlbumApi papi = JsonAlbumApiImpl();
//   final List<PhotoDto> photoList = await api.getPhoto(3);
//
//   print(photoList);
// }

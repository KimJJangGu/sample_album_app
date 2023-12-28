import 'package:album_app/model/photo.dart';
import '../model/album.dart';

abstract interface class AlbumApi {
  Future<Album> getAlbum();
  Future<Photo> getPhoto();
}
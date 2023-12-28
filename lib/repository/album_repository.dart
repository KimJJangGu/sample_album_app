import '../model/album.dart';
import '../model/photo.dart';

abstract interface class AlbumRepository {
  Future<List<Album>> getAlbum();

  Future<List<Photo>> getPhoto(String albumId);
}
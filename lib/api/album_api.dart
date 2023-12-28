import '../dto/album_dto.dart';
import '../dto/photo_dto.dart';

abstract interface class AlbumApi {
  Future<List<AlbumDto>> getAlbum();

  Future<List<PhotoDto>> getPhoto(String albumId);
}
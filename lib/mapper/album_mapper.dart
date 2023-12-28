import 'package:album_app/model/album.dart';
import '../dto/album_dto.dart';

extension AlbumMapper on AlbumDto {
  Album dtoToAlbum() {
    return Album(
      id: id?.toInt() ?? 0,
      title: title ?? '',
    );
  }
}
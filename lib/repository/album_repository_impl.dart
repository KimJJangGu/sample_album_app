import 'package:album_app/api/album_api.dart';
import 'package:album_app/api/json_album_api_impl.dart';
import 'package:album_app/mapper/album_mapper.dart';
import 'package:album_app/mapper/photo_mapper.dart';
import 'package:album_app/repository/album_repository.dart';
import '../dto/photo_dto.dart';
import '../model/album.dart';
import '../model/photo.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumApi _albumApi = JsonAlbumApiImpl();

  @override
  Future<List<Album>> getAlbum() async {
    return (await _albumApi.getAlbum()).map((e) => e.dtoToAlbum()).toList();
  }

  @override
  Future<List<Photo>> getPhoto(String albumId) async {
    final List<PhotoDto> photoDtoList = await _albumApi.getPhoto(albumId);
    final List<Photo> photoList = [];
    for (final PhotoDto photoDto in photoDtoList) {
      // Photo(title: photoDto.title ?? '', url: photoDto.url ?? '', thumbnailUrl: photoDto.thumbnailUrl ?? '');
      final Photo photo = photoDto.dtoToPhoto();
      photoList.add(photo);
    }
    return photoList;

    // final Iterable<Photo> iterPhoto = photoDtoList.map((e) => e.dtoToPhoto());
    // return iterPhoto.toList();
  }
}
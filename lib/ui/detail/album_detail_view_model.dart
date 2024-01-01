import 'dart:async';
import 'package:album_app/model/photo.dart';
import 'package:album_app/repository/album_repository.dart';
import 'package:album_app/repository/album_repository_impl.dart';

class AlbumDetailViewModel {
  final AlbumRepository _albumRepository = AlbumRepositoryImpl();

  List<Photo> _photoList = [];
  List<Photo> get photoList => List.unmodifiable(_photoList);

  final StreamController<bool> _isLoading = StreamController();
  Stream<bool> get isLoading => _isLoading.stream;


  Future<void> getPhotoList(String id) async {
    _isLoading.add(true);
    _photoList = await _albumRepository.getPhoto(id);
    _isLoading.add(false);
  }
}
import 'dart:async';
import '../../model/album.dart';
import '../../repository/album_repository.dart';
import '../../repository/album_repository_impl.dart';

class AlbumMainViewModel {
  final AlbumRepository _repository = AlbumRepositoryImpl();

  final StreamController<bool> _isLoading = StreamController(); // Controller 데이터를 던져줌, 스피커
  Stream<bool> get isLoading => _isLoading.stream; // Stream 받음, 리스너

  List<Album> _albumList = [];
  List<Album> get albumList => List.unmodifiable(_albumList); // 접근 못하게 막기, 리스트 수정 못하게 함

  Future<void> getAlbumList() async {
    _isLoading.add(true); // add() stream에 데이터 전달
    _albumList = await _repository.getAlbum();
    _isLoading.add(false); // getAlbum이 완료되면 로딩 상태 false
    // print(_albumList);
  }
}
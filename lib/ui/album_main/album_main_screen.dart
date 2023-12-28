import 'package:album_app/repository/album_repository.dart';
import 'package:album_app/repository/album_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../model/album.dart';

class AlbumMainScreen extends StatelessWidget {
  AlbumMainScreen({super.key});

  final AlbumRepository repository = AlbumRepositoryImpl();
 // 객체 생성
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('앨범 목록'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: repository.getAlbum(), // repository의 함수 호출
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final List<Album> albumList = snapshot.data!;

            return ListView(
                // 위젯 반환
                padding: const EdgeInsets.all(8),
                children: albumList.map((album) {
                  return ListTile(
                    title: Text(album.title),
                    onTap: () {
                      context.push(Uri(path: '/main/detail', queryParameters: {'albumId': album.id.toString()}).toString());
                    },
                  );
                }).toList());
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

import 'package:album_app/model/photo.dart';
import 'package:flutter/material.dart';
import '../../repository/album_repository.dart';
import '../../repository/album_repository_impl.dart';

class AlbumDetailScreen extends StatelessWidget {
  final String albumId;
  final AlbumRepository repository = AlbumRepositoryImpl();

  AlbumDetailScreen({super.key, required this.albumId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('사진?'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: repository.getPhoto(albumId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final List<Photo> albumList = snapshot.data!;
          }
          return Text('fsd');
        },
      ),
    );
  }
}

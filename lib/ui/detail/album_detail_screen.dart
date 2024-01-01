import 'package:album_app/model/photo.dart';
import 'package:album_app/ui/detail/album_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlbumDetailScreen extends StatefulWidget {
  AlbumDetailScreen({super.key, required String albumId});

  @override
  State<AlbumDetailScreen> createState() => _AlbumDetailScreenState();
}

class _AlbumDetailScreenState extends State<AlbumDetailScreen> {
  final AlbumDetailViewModel _albumDetailViewModel = AlbumDetailViewModel();

  @override
  void initState() {
    _albumDetailViewModel.getPhotoList('1');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _albumDetailViewModel.getPhotoList('1'); // 아이콘 버튼을 터치하여 사진 리스트를 새로고침
              },
              icon: const Icon(Icons.refresh))
        ],
        title: const Text('사진'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder<bool>(
        initialData: false,
        stream: _albumDetailViewModel.isLoading,
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return const Center(child: CircularProgressIndicator());
          }
          final List<Photo> photoList = _albumDetailViewModel.photoList;
          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: GridView.builder(
              itemCount: photoList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 32,
                mainAxisSpacing: 32,
              ),
              itemBuilder: (context, index) {
                final photoLists = photoList[index];
                return GestureDetector(
                  onTap: () {
                    context.push(Uri(path: '/main/detail/photo', queryParameters: {'title': photoLists.title, 'url': photoLists.url}).toString());
                  },
                  child: GridTile(
                    child: Image.network(
                      photoLists.thumbnailUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

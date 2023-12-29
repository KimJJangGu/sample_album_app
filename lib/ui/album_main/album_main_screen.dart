import 'package:album_app/ui/album_main/album_main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlbumMainScreen extends StatefulWidget {
  // 앱 실행 시 가장 먼저 생성자 호출
  const AlbumMainScreen({super.key});

  @override
  State<AlbumMainScreen> createState() => _AlbumMainScreenState();
}

class _AlbumMainScreenState extends State<AlbumMainScreen> {
  final AlbumMainViewModel _viewModel = AlbumMainViewModel(); // viewModel 객체 생성

  @override
  void initState() {
    _viewModel.getAlbumList(); // viewModel의 getAlbumList() 호출
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              _viewModel.getAlbumList(); // 아이콘 버튼을 터치하여 앨범 리스트를 새로고침
            }, icon: const Icon(Icons.refresh))
          ],
          title: const Text('앨범 목록'),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
          backgroundColor: Colors.blue,
        ),
        body: StreamBuilder<bool>(
          initialData: false,
          stream: _viewModel.isLoading,
          builder: (context, snapshot) {
            if(snapshot.data == true) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView(
              // 위젯 반환
                padding: const EdgeInsets.all(8),
                children: _viewModel.albumList.map((album) {
                  return ListTile(
                    title: Text(album.title),
                    onTap: () {
                      context.push(Uri(path: '/main/detail', queryParameters: {'albumId': album.id.toString()}).toString());
                    },
                  );
                }).toList());
          }
        )
    );
  }
}

// FutureBuilder(
//         future: repository.getAlbum(), // repository의 함수 호출
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             final List<Album> albumList = snapshot.data!;
//
//             return ListView(
//                 // 위젯 반환
//                 padding: const EdgeInsets.all(8),
//                 children: albumList.map((album) {
//                   return ListTile(
//                     title: Text(album.title),
//                     onTap: () {
//                       context.push(Uri(path: '/main/detail', queryParameters: {'albumId': album.id.toString()}).toString());
//                     },
//                   );
//                 }).toList());
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
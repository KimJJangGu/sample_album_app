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
  void initState() { // state 객체가 생성되면 state 객체의 생성자가 호출, 위젯이 최초 생성되는 상황이면 initState()가 호출 됨, 처음 한번만 호출되고 다시 호출되지 않음
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
          initialData: false, // 로딩 최초 상태를 false로 지정
          stream: _viewModel.isLoading, // stream의 bool 값을 받는다
          builder: (context, snapshot) {
            if(snapshot.data == true) { // isLoading stream의 bool 값이 true이면 
              return const Center(child: CircularProgressIndicator()); // CircularProgressIndicator 표시
            }
            return ListView(
              // 위젯 반환
                padding: const EdgeInsets.all(8),
                children: _viewModel.albumList.map((album) { // view model의 List<Album> 받기
                  return ListTile(
                    title: Text(album.title),
                    onTap: () { // 목록을 tap하면 해당 경로로 이동(go router 이용)
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
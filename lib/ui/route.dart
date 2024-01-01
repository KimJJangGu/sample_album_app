import 'package:go_router/go_router.dart';
import 'album_main/album_main_screen.dart';
import 'package:album_app/ui/detail/album_detail_screen.dart';
import 'package:album_app/ui/detail/photo_screen.dart';

final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) => const AlbumMainScreen(),
      // routes: [
      //  안에 넣으면 연결
      // ]
    ),
    GoRoute(
      path: '/main/detail',
      builder: (context, state) {
        final String albumId = state.uri.queryParameters['albumId']!;
        return AlbumDetailScreen(albumId: albumId);
      },
    ),
    GoRoute(
      path: '/main/detail/photo',
      builder: (context, state) {
        final String title = state.uri.queryParameters['title']!;
        final String url = state.uri.queryParameters['url']!;
        return PhotoScreen(title: title, url: url,);
      },
    ),
  ],
);

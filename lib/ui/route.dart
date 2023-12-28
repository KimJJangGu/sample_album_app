import 'dart:core';

import 'package:album_app/ui/detail/album_detail_screen.dart';
import 'package:go_router/go_router.dart';
import 'album_main/album_main_screen.dart';

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
  ],
);

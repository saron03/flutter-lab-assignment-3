import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/models/album.dart';
import '../presentation/screens/album_list_screen.dart';
import '../presentation/screens/album_detail_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String albumDetail = '/album/:albumId';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: home,
        builder: (BuildContext context, GoRouterState state) {
          return const AlbumListScreen();
        },
      ),
      GoRoute(
        path: albumDetail,
        builder: (BuildContext context, GoRouterState state) {
          final albumId = int.parse(state.pathParameters['albumId']!);
          final album = state.extra as Album?;
          return AlbumDetailScreen(
            albumId: albumId,
            userId: album?.userId ?? 0,
          );
        },
      ),
    ],
  );
}

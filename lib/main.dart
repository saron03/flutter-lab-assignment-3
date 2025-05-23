import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'domain/blocs/album/album_bloc.dart';
import 'domain/blocs/photo/photo_bloc.dart';
import '../../domain/blocs/album/album_event.dart';
import 'data/repositories/album_repository.dart';
import 'data/services/api_service.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    final albumRepository = AlbumRepository(apiService);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AlbumBloc(albumRepository)..add(FetchAlbums()),
        ),
        BlocProvider(
          create: (context) => PhotoBloc(albumRepository),
        ),
      ],
      child: MaterialApp.router(
        title: 'Album Viewer',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
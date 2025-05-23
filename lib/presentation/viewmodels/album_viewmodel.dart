// ignore: unused_import
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/blocs/album/album_bloc.dart';
import '../../domain/blocs/album/album_event.dart';
import '../../domain/blocs/album/album_state.dart';
import '../../data/models/album.dart';

class AlbumViewModel {
  final AlbumBloc _albumBloc;

  AlbumViewModel(this._albumBloc) {
    _albumBloc.add(FetchAlbums());
  }

  Stream<AlbumState> get albumState => _albumBloc.stream;

  List<Album> getAlbums(AlbumState state) {
    if (state is AlbumLoaded) {
      return state.albums;
    }
    return [];
  }

  String? getError(AlbumState state) {
    if (state is AlbumError) {
      return state.message;
    }
    return null;
  }

  bool isLoading(AlbumState state) {
    return state is AlbumLoading;
  }

  void fetchAlbums() {
    _albumBloc.add(FetchAlbums());
  }

  void dispose() {
    _albumBloc.close();
  }
}
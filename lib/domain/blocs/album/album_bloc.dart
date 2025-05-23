import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/album_repository.dart';
import 'album_event.dart';
import 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository _albumRepository;

  AlbumBloc(this._albumRepository) : super(AlbumInitial()) {
    on<FetchAlbums>(_onFetchAlbums);
  }

  Future<void> _onFetchAlbums(FetchAlbums event, Emitter<AlbumState> emit) async {
    emit(AlbumLoading());
    try {
      final albums = await _albumRepository.fetchAlbums();
      emit(AlbumLoaded(albums));
    } catch (e) {
      emit(AlbumError(e.toString()));
    }
  }
}
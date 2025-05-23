import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/album_repository.dart';
import 'photo_event.dart';
import 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final AlbumRepository _albumRepository;

  PhotoBloc(this._albumRepository) : super(PhotoInitial()) {
    on<FetchPhotos>(_onFetchPhotos);
  }

  Future<void> _onFetchPhotos(FetchPhotos event, Emitter<PhotoState> emit) async {
    emit(PhotoLoading());
    try {
      final photos = await _albumRepository.fetchPhotos(event.albumId);
      emit(PhotoLoaded(photos));
    } catch (e) {
      emit(PhotoError(e.toString()));
    }
  }
}
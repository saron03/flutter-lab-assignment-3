// ignore: unused_import
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/blocs/photo/photo_bloc.dart';
import '../../domain/blocs/photo/photo_event.dart';
import '../../domain/blocs/photo/photo_state.dart';
import '../../data/models/photo.dart';

class PhotoViewModel {
  final PhotoBloc _photoBloc;

  PhotoViewModel(this._photoBloc);

  void fetchPhotos(int albumId) {
    _photoBloc.add(FetchPhotos(albumId));
  }

  Stream<PhotoState> get photoState => _photoBloc.stream;

  List<Photo> getPhotos(PhotoState state) {
    if (state is PhotoLoaded) {
      return state.photos;
    }
    return [];
  }

  String? getError(PhotoState state) {
    if (state is PhotoError) {
      return state.message;
    }
    return null;
  }

  bool isLoading(PhotoState state) {
    return state is PhotoLoading;
  }

  void dispose() {
    _photoBloc.close();
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/blocs/photo/photo_bloc.dart';
import '../../domain/blocs/photo/photo_event.dart';
import '../../domain/blocs/photo/photo_state.dart';
import '../../data/models/photo.dart';

class AlbumDetailScreen extends StatelessWidget {
  final int albumId;
  final int userId;
  final String title; // Added to receive album title

  const AlbumDetailScreen({
    super.key,
    required this.albumId,
    required this.userId,
    required this.title, // Added to constructor
  });

  @override
  Widget build(BuildContext context) {
    context.read<PhotoBloc>().add(FetchPhotos(albumId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Album $albumId (User $userId)'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Album ID: $albumId | User ID: $userId | Title: $title', // Added title
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: BlocBuilder<PhotoBloc, PhotoState>(
              builder: (context, state) {
                if (state is PhotoLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PhotoLoaded) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1,
                    ),
                    itemCount: state.photos.length,
                    itemBuilder: (context, index) {
                      final photo = state.photos[index];
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.network(
                                photo.thumbnailUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                photo.title,
                                style: const TextStyle(fontSize: 14),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (state is PhotoError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Error: ${state.message}'),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<PhotoBloc>().add(FetchPhotos(albumId));
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }
                return const Center(child: Text('No photos available'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
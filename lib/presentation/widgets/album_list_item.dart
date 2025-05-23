import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/album.dart';
import '../../routes/app_routes.dart';

class AlbumListItem extends StatelessWidget {
  final Album album;
  final String? thumbnailUrl;

  const AlbumListItem({
    super.key,
    required this.album,
    this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: thumbnailUrl != null
          ? Image.network(
              thumbnailUrl!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
            )
          : const Icon(Icons.album),
      title: Text(
        album.title,
        style: const TextStyle(fontSize: 16),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        context.push(
          AppRoutes.albumDetail.replaceFirst(':albumId', album.id.toString()),
          extra: album, // Pass the entire Album object
        );
      },
    );
  }
}
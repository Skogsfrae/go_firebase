import 'package:flutter/material.dart';
import 'package:go_firebase/models/album.dart';
import 'package:go_firebase/routing/routes.dart';

class AlbumCard extends StatelessWidget {
  final Album album;

  const AlbumCard({
    super.key,
    required this.album,
  });

  @override
  Widget build(BuildContext context) => Card(
        elevation: 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            child: InkWell(
              onTap: () => AlbumPageData(album.id).go(context),
              child: Ink(
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: album.albumArt != null
                                ? DecorationImage(
                                    image: NetworkImage(album.albumArt!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      if (album.name != null)
                        Text(
                          album.name!,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text('${album.author} - ${album.year}', style: Theme.of(context).textTheme.labelSmall,)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:go_firebase/models/album.dart';
import 'package:go_firebase/routing/routes.dart';

class AlbumCard extends StatelessWidget {
  final String id;
  final String albumArt;
  final String name;
  final String author;
  final int year;

  const AlbumCard({
    super.key,
    required this.id,
    required this.albumArt,
    required this.name,
    required this.author,
    required this.year,
  });

  factory AlbumCard.fromAlbum(Album album) => AlbumCard(
        id: album.id,
        name: album.name,
        albumArt: album.albumArt,
        author: album.author,
        year: album.year,
      );

  @override
  Widget build(BuildContext context) => Card(
        elevation: 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            child: InkWell(
              onTap: () => AlbumPageData(id).go(context),
              child: Ink(
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(albumArt),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        name,
                        style: Theme.of(context).textTheme.titleSmall,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              '$author - $year',
                              style: Theme.of(context).textTheme.labelSmall,
                              maxLines: 2,
                            )
                          )
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

import 'package:flutter/material.dart';
import 'package:go_firebase/routing/routes.dart';

class AlbumCard extends StatelessWidget {
  final String id;
  final String? albumArt;
  final String name;
  final String author;
  final int year;

  const AlbumCard({
    super.key,
    required this.id,
    this.albumArt,
    required this.name,
    required this.author,
    required this.year,
  });

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: albumArt != null
                                ? DecorationImage(
                                    image: NetworkImage(albumArt!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        name,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text('$author - $year', style: Theme.of(context).textTheme.labelSmall,)
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_firebase/models/album.dart';
import 'package:go_firebase/repo/data_repository.dart';
import 'package:go_firebase/services/dynamic_link_service.dart';
import 'package:go_router/go_router.dart';

class AlbumPage extends StatelessWidget {
  final String albumId;

  Album? get album => AlbumRepository.fetchAlbumById(albumId: albumId);

  List<Song> get songs => album?.songs ?? const [];

  const AlbumPage({
    required this.albumId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            stretch: true,
            flexibleSpace: album != null ? _AlbumPageTitle(album!) : null,
            actions: [
              IconButton(
                onPressed: () async {
                  final dynamiclink = await DynamicLinkService.instance
                      .getDynamicLinkFromLocation(
                    GoRouterState.of(context).location,
                  );
                  await Clipboard.setData(
                    ClipboardData(text: dynamiclink),
                  );
                },
                icon: Icon(Icons.adaptive.share),
              )
            ],
          ),
          SliverFillRemaining(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              primary: false,
              shrinkWrap: true,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return _SongRow.fromSong(
                  song: songs[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SongRow extends StatelessWidget {
  final String id;
  final int position;
  final Duration duration;
  final String title;
  final String author;

  factory _SongRow.fromSong({
    Key? key,
    required Song song,
  }) =>
      _SongRow(
        key: key,
        id: song.id,
        position: song.position,
        duration: song.duration,
        title: song.title,
        author: song.author,
      );

  const _SongRow({
    super.key,
    required this.id,
    required this.position,
    required this.duration,
    required this.title,
    required this.author,
  });

  @override
  Widget build(BuildContext context) => ListTile(
        dense: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(position.toString()),
          ],
        ),
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(author, style: Theme.of(context).textTheme.bodySmall),
        trailing: Text(
          duration.toString().substring(2, 7),
          style: Theme.of(context).textTheme.labelSmall,
        ),
      );
}

class _AlbumPageTitle extends StatelessWidget {
  final Album album;

  const _AlbumPageTitle(this.album);

  @override
  Widget build(BuildContext context) => FlexibleSpaceBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(album.name),
            Text(
              album.author,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        centerTitle: false,
        background: Container(
          foregroundDecoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black,
              ],
              stops: [
                .5,
                1,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Image(
            image: NetworkImage(
              album.albumArt,
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
}

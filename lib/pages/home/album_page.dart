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
                      .getDynamicLinkFromGoRouterState(
                    GoRouterState.of(context),
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
                return _SongRow(
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
  final Song song;

  const _SongRow({
    super.key,
    required this.song
  });

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Row(
            children: [
              Text(song.position.toString()),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (song.title != null)
                    Text(song.title!),
                  //if (song.aut != null)  
                  //Text(song.autho!r, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              const Spacer(),
              if (song.duration != null)
                Text(
                  song.duration!,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
            ],
          ),
        ),
      );
}

class _AlbumPageTitle extends StatelessWidget {

  final Album album;

  _AlbumPageTitle(this.album);

  @override
  Widget build(BuildContext context) => FlexibleSpaceBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (album.name != null)
            Text(album.name!),
            if (album.author != null)
              Text(
                album.author!,
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
              album.albumArt ?? "",
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
}

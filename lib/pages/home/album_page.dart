import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_firebase/models/album.dart';
import 'package:go_firebase/repo/data_repository.dart';
import 'package:go_firebase/services/dynamic_link_service.dart';
import 'package:go_router/go_router.dart';
import 'package:palette_generator/palette_generator.dart';

class AlbumPage extends StatefulWidget {
  final String albumId;

  const AlbumPage({
    required this.albumId,
    super.key,
  });

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  Album? get album => AlbumRepository.fetchAlbumById(albumId: widget.albumId);

  List<Song> get songs => album?.songs ?? const [];
  PaletteGenerator? paletteGenerator;
  late final CachedNetworkImageProvider _imageProvider;

  @override
  void initState() {
    super.initState();
    _imageProvider = CachedNetworkImageProvider(
      album!.albumArt,
    );

    PaletteGenerator.fromImageProvider(
      _imageProvider,
    ).then((value) {
      setState(() {
        paletteGenerator = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.bottomRight,
            colors: [
              paletteGenerator?.dominantColor?.color ?? Colors.transparent,
              paletteGenerator?.darkMutedColor?.color ?? Colors.black,
            ],
            radius: 2,
          ),
        ),
        duration: const Duration(milliseconds: 200),
        child: CustomScrollView(
          primary: true,
          slivers: [
            SliverAppBar.large(
              stretch: true,
              backgroundColor: paletteGenerator?.dominantColor?.color,
              flexibleSpace: _AlbumPageTitle(
                album: album!,
                imageProvider: _imageProvider,
              ),
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
                    _showSnackBar();
                  },
                  icon: Icon(Icons.adaptive.share),
                ),
              ],
            ),
            SliverSafeArea(
              top: false,
              minimum: const EdgeInsets.all(16.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  ListTile.divideTiles(
                    context: context,
                    tiles: songs.map(_SongRow.fromSong),
                  ).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar() {

    const snackBar = SnackBar(
      content: Text(
      '🔗 DynamicLink copied to clipboard',
    ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      elevation: 20,
      margin: EdgeInsets.all(16),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class _SongRow extends StatelessWidget {
  final String id;
  final int position;
  final Duration duration;
  final String title;
  final String author;

  factory _SongRow.fromSong(Song song) => _SongRow(
        key: Key(song.id),
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
  Widget build(BuildContext context) {
    return ListTile(
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
}

class _AlbumPageTitle extends StatelessWidget {
  final Album album;
  final ImageProvider imageProvider;

  const _AlbumPageTitle({
    required this.album,
    required this.imageProvider,
  });

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
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      );
}

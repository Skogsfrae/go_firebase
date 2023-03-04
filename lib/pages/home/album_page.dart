import 'package:flutter/material.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            stretch: true,
            flexibleSpace: _AlbumPageTitle(),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.adaptive.share),
              )
            ],
          ),
          SliverFillRemaining(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              primary: false,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => const _SongRow(
                id: '',
                author: 'Gorillaz',
                title: 'Rhinestone Eyes',
                duration: Duration(minutes: 3, seconds: 20),
                position: 4,
              ),
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

  const _SongRow({
    super.key,
    required this.id,
    required this.position,
    required this.duration,
    required this.title,
    required this.author,
  });

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Row(
            children: [
              Text(position.toString()),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title),
                  Text(author, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              const Spacer(),
              Text(
                duration.toString().substring(2, 7),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      );
}

class _AlbumPageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FlexibleSpaceBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Plastic Beach'),
            Text(
              'Gorillaz - 2010',
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
          child: const Image(
            image: NetworkImage(
              'https://m.media-amazon.com/images/I/81EP2fxHLRL._AC_SX466_.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
}

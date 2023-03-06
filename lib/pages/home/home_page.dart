import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_firebase/components/album_card.dart';
import 'package:go_firebase/repo/data_repository.dart';
import 'package:go_firebase/routing/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                  'Welcome ${FirebaseAuth.instance.currentUser!.displayName}'),
              centerTitle: false,
              actions: [
                GestureDetector(
                  child: const UserAvatar(
                    size: 40,
                  ),
                  onTap: () => ProfilePageData().go(context),
                ),
              ],
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Most listened albums ever',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            SliverGrid.count(
              childAspectRatio: 3 / 4,
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: AlbumRepository.mostListenedAlbums()
                  .map(AlbumCard.fromAlbum)
                  .toList(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 24,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Gorillaz Albums',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            SliverGrid.count(
              childAspectRatio: 3 / 4,
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: AlbumRepository.gorillazAlbums()
                  .map(AlbumCard.fromAlbum)
                  .toList(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 24,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

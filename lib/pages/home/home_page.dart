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
              title: Text('Welcome ${FirebaseAuth.instance.currentUser!.displayName}'),
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
            SliverGrid.count(
              childAspectRatio: 3 / 4,
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: AlbumRepository.fetchAlbumList().map((album) => AlbumCard(album: album,)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

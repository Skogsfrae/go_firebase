import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_firebase/components/album_card.dart';
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
              children: const [
                AlbumCard(
                  id: 'id',
                  name: 'Demon days',
                  author: 'Gorillaz',
                  year: 2005,
                  albumArt:
                      'https://www.londondrugs.com/on/demandware.static/-/Sites-londondrugs-master/default/dw8c9e08fa/products/L0067030/large/L0067030.JPG',
                ),
                AlbumCard(
                  id: 'id',
                  name: 'Plastic Beach',
                  author: 'Gorillaz',
                  year: 2010,
                  albumArt:
                      'https://m.media-amazon.com/images/I/81EP2fxHLRL._AC_SX466_.jpg',
                ),
                AlbumCard(
                  id: 'id',
                  name: 'name',
                  author: 'author',
                  year: 2020,
                  albumArt:
                      'https://images.radiox.co.uk/images/325126?crop=16_9&width=660&relax=1&signature=SnBhWdoj4LTMSpbiHZrKXI_p8OA=',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

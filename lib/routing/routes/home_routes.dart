import 'package:flutter/material.dart';
import 'package:go_firebase/pages/auth/profile_page.dart';
import 'package:go_firebase/pages/home/album_page.dart';
import 'package:go_firebase/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';

part 'home_routes.g.dart';

@TypedGoRoute<HomeRouteData>(
  path: '/home',
  routes: [
    TypedGoRoute<ProfilePageData>(
      path: 'profile',
    ),
    TypedGoRoute<AlbumPageData>(
      path: 'album/:id',
    ),
  ],
)
class HomeRouteData extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class ProfilePageData extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfilePage();
  }
}

class AlbumPageData extends GoRouteData {
  final String id;

  AlbumPageData(this.id);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AlbumPage();
  }
}

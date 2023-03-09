import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_firebase/components/push_notification_handler.dart';
import 'package:go_firebase/pages/auth/editor_page.dart';
import 'package:go_firebase/pages/auth/profile_page.dart';
import 'package:go_firebase/pages/home/album_page.dart';
import 'package:go_firebase/pages/home/home_page.dart';
import 'package:go_firebase/pages/home/not_found_page.dart';
import 'package:go_firebase/repo/data_repository.dart';
import 'package:go_firebase/services/dynamic_link_service.dart';
import 'package:go_firebase/services/remote_config_service.dart';
import 'package:go_router/go_router.dart';

part 'home_routes.g.dart';

@TypedGoRoute<HomeRouteData>(
  path: '/home',
  routes: [
    TypedGoRoute<ProfilePageData>(
      path: 'profile',
      routes: [
        TypedGoRoute<EditorPageData>(
          path: 'editor-page',
        ),
      ],
    ),
    TypedGoRoute<AlbumPageData>(
      path: 'album/:id',
    ),
    TypedGoRoute<NotFoundPageData>(
      path: 'not-found/:entity',
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
  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final album = AlbumRepository.fetchAlbumById(albumId: id);

    if (album != null) return null;

    return NotFoundPageData('album').location;
  }

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    final uri = Uri.parse(state.location);

    if ([
      DynamicLinkService.dynamicLinkScheme,
      pushNotificationScheme,
    ].contains(uri.scheme)) {
      return CupertinoPage(
        fullscreenDialog: true,
        child: AlbumPage(
          albumId: id,
        ),
      );
    }

    return MaterialPage(
      child: AlbumPage(
        albumId: id,
      ),
    );
  }
}

class EditorPageData extends GoRouteData {
  EditorPageData();

  @override
  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    if (RemoteConfigService.instance.hasEditorSuperPowers) return null;

    return HomeRouteData().location;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EditorPage();
  }
}

class NotFoundPageData extends GoRouteData {
  final String entity;
  NotFoundPageData(this.entity);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NotFountPage(
      entity: entity,
    );
  }
}

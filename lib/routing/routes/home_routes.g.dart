// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $homeRouteData,
    ];

GoRoute get $homeRouteData => GoRouteData.$route(
      path: '/home',
      factory: $HomeRouteDataExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'profile',
          factory: $ProfilePageDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'editor-page',
              factory: $EditorPageDataExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'album/:id',
          factory: $AlbumPageDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'not-found/:entity',
          factory: $NotFoundPageDataExtension._fromState,
        ),
      ],
    );

extension $HomeRouteDataExtension on HomeRouteData {
  static HomeRouteData _fromState(GoRouterState state) => HomeRouteData();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ProfilePageDataExtension on ProfilePageData {
  static ProfilePageData _fromState(GoRouterState state) => ProfilePageData();

  String get location => GoRouteData.$location(
        '/home/profile',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EditorPageDataExtension on EditorPageData {
  static EditorPageData _fromState(GoRouterState state) => EditorPageData();

  String get location => GoRouteData.$location(
        '/home/profile/editor-page',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $AlbumPageDataExtension on AlbumPageData {
  static AlbumPageData _fromState(GoRouterState state) => AlbumPageData(
        state.params['id']!,
      );

  String get location => GoRouteData.$location(
        '/home/album/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $NotFoundPageDataExtension on NotFoundPageData {
  static NotFoundPageData _fromState(GoRouterState state) => NotFoundPageData(
        state.params['entity']!,
      );

  String get location => GoRouteData.$location(
        '/home/not-found/${Uri.encodeComponent(entity)}',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

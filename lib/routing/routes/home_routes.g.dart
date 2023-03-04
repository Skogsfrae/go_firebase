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
        ),
      ],
    );

extension $HomeRouteDataExtension on HomeRouteData {
  static HomeRouteData _fromState(GoRouterState state) => HomeRouteData();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

extension $ProfilePageDataExtension on ProfilePageData {
  static ProfilePageData _fromState(GoRouterState state) => ProfilePageData();

  String get location => GoRouteData.$location(
        '/home/profile',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: this);
}

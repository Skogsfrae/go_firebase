// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $authPageData,
    ];

GoRoute get $authPageData => GoRouteData.$route(
      path: '/auth',
      factory: $AuthPageDataExtension._fromState,
    );

extension $AuthPageDataExtension on AuthPageData {
  static AuthPageData _fromState(GoRouterState state) => AuthPageData(
        from: state.queryParams['from'],
      );

  String get location => GoRouteData.$location(
        '/auth',
        queryParams: {
          if (from != null) 'from': from,
        },
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

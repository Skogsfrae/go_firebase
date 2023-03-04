import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:go_firebase/routing/routes.dart';
import 'package:go_firebase/services/auth/auth_service.dart';
import 'package:go_router/go_router.dart';

// The reason for this is to create a kind of singleton pattern to avoid a new
// instance of the router on each hot reload. Since the material app is wrapped
// inside a builder function this would cause a new instance of builder.
class GoFirebaseRouter {
  static GoFirebaseRouter? _instance;
  static GoFirebaseRouter get instance => _instance ??= GoFirebaseRouter._();

  GoFirebaseRouter._();

  static late GoRouter router;

  /// Initialize [router] with a pretty configured [GoRouter] instance.
  /// If [router] was already initialized immediatly returns current instance.
  static GoRouter initAppRouter(BuildContext context) {
    router = GoRouter(
      initialLocation: '/home',
      refreshListenable: Listenable.merge([
        AuthService.instance,
      ]),
      routes: appRoutes,
      redirect: (BuildContext context, GoRouterState state) {
        final authService = AuthService.instance;
        final bool authFlow = state.location.contains('/auth');

        // bind the location the user is coming from to a query parameter
        final fromp = state.subloc;

        if (!authService.loggedIn) {
          return AuthPageData(from: fromp).location;
        } else if (authService.loggedIn && authFlow) {
          return HomeRouteData().location;
        }

        if (state.location == '/') return HomeRouteData().location;

        // no need to redirect
        return null;
      },
    );

    router.addListener(() {
      FirebaseCrashlytics.instance.log('Route: ${router.location}');
    });

    return router;
  }
}
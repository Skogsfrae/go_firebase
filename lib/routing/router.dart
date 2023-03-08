import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:go_firebase/pages/home/not_found_page.dart';
import 'package:go_firebase/routing/routes.dart';
import 'package:go_firebase/services/auth/auth_service.dart';
import 'package:go_firebase/services/dynamic_link_service.dart';
import 'package:go_router/go_router.dart';

class GoFirebaseRouter {
  static GoFirebaseRouter? _instance;
  static GoFirebaseRouter get instance => _instance ??= GoFirebaseRouter._();

  GoFirebaseRouter._();

  late final GoRouter router;

  /// Initialize [router] with a pretty configured [GoRouter] instance.
  GoRouter initAppRouter(BuildContext context) {
    final initialRoute = DynamicLinkService.instance.initialRoute;

    router = GoRouter(
      initialLocation: initialRoute?.toString() ?? '/home',
      errorBuilder: (context, state) => const NotFountPage(entity: 'page'),
      refreshListenable: Listenable.merge([
        AuthService.instance,
      ]),
      debugLogDiagnostics: true,
      routes: appRoutes,
      redirect: (BuildContext context, GoRouterState state) {
        final authService = AuthService.instance;
        final bool authFlow = state.subloc.contains('/auth');

        if (!authService.loggedIn && !authFlow) {
          // bind the location the user is coming from to a query parameter
          final fromp = state.location;

          return AuthPageData(from: fromp).location;
        } else if (authService.loggedIn && authFlow) {
          if (state.queryParams['from'] != null) {
            return state.queryParams['from'];
          }

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

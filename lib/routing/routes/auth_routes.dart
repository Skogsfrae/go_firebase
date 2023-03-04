import 'package:flutter/material.dart';
import 'package:go_firebase/pages/auth/auth_page.dart';
import 'package:go_router/go_router.dart';

part 'auth_routes.g.dart';

@TypedGoRoute<AuthPageData>(path: '/auth')
class AuthPageData extends GoRouteData {
  final String? from;

  AuthPageData({
    this.from,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AuthPage();
  }
}

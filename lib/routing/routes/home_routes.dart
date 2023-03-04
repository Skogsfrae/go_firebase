import 'package:flutter/material.dart';
import 'package:go_firebase/pages/auth/profile_page.dart';
import 'package:go_firebase/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';

part 'home_routes.g.dart';

@TypedGoRoute<HomeRouteData>(path: '/home', routes: [
  TypedGoRoute<ProfilePageData>(
    path: 'profile',
  )
])
class HomeRouteData extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomePage();
  }
}

class ProfilePageData extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfilePage();
  }
}

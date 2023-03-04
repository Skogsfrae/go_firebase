
import 'package:flutter/material.dart';
import 'package:go_firebase/routing/router.dart';


class GoFirebaseApp extends StatefulWidget {
  const GoFirebaseApp({super.key});

  @override
  State<GoFirebaseApp> createState() => _GoFirebaseAppState();
}

class _GoFirebaseAppState extends State<GoFirebaseApp> {
  late final router = GoFirebaseRouter.initAppRouter(context);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go Firebase',
      theme: ThemeData.dark(useMaterial3: true),
      routerConfig: router,
    );
  }
}

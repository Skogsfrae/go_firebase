import 'package:flutter/material.dart';
import 'package:go_firebase/components/push_notification_handler.dart';
import 'package:go_firebase/routing/router.dart';

class GoFirebaseApp extends StatefulWidget {
  const GoFirebaseApp({super.key});

  @override
  State<GoFirebaseApp> createState() => _GoFirebaseAppState();
}

class _GoFirebaseAppState extends State<GoFirebaseApp> {
  late final router = GoFirebaseRouter.instance.initAppRouter(context);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go Firebase',
      themeMode: ThemeMode.dark,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      routerConfig: router,
      builder: (BuildContext context, Widget? child) {
        if (child == null) return const SizedBox.shrink();

        return Overlay(
          initialEntries: [
            OverlayEntry(builder: (BuildContext context) {
              return PushNotificationHandler(child: child);
            })
          ],
        );
      },
    );
  }
}

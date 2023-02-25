
import 'package:flutter/material.dart';

class GoFirebaseApp extends StatelessWidget {
  const GoFirebaseApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go Firebase',
      theme: ThemeData.dark(useMaterial3: true),
    );
  }
}

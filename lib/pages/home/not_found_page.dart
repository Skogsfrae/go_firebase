import 'package:flutter/material.dart';
import 'package:go_firebase/routing/routes.dart';
import 'package:go_router/go_router.dart';

class NotFountPage extends StatelessWidget {
  final String entity;
  const NotFountPage({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.music_off),
            Text('$entity not found'),
            if (!GoRouter.of(context).canPop())
              ElevatedButton(
                child: const Text('Go Home'),
                onPressed: () {
                  HomeRouteData().go(context);
                },
              )
          ],
        ),
      ),
    );
  }
}

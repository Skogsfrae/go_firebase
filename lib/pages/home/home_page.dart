import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_firebase/routing/routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text('Go Flutter App'),
        actions: [
          GestureDetector(
            child: const UserAvatar(
              size: 40,
            ),
            onTap: () => ProfilePageData().go(context),
          ),
        ],
      ),
      body: const Center(
        child: Card(
          elevation: 3,
          child: Text('A nice card in home'),
        ),
      ),
    );
  }
}

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_firebase/routing/routes/home_routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => ProfileScreen(
        avatarPlaceholderColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          title: const Text('Your Profile'),
        ),
        children: [
          ListTile(
            leading: const Icon(Icons.star_rounded),
            title: const Text('Editor Menu'),
            tileColor: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            trailing:  const Icon(Icons.chevron_right_rounded),
            onTap: () {
              EditorPageData().go(context);
            },
          ),
        ],
      );
}

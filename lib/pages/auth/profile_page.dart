import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => ProfileScreen(
      appBar: AppBar(
        title: const Text('Your Profile'),
      ),
      children: [
        ListTile(
          leading: const Icon(Icons.local_activity),
          title: const Text('Activity'),
          tileColor: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.chevron_right_rounded),
            onPressed: () {},
          ),
          onTap: () {},
        )
      ],
    );
}
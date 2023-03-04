import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

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
            leading: const Icon(Icons.local_activity),
            title: const Text('Activity'),
            tileColor: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.chevron_right_rounded),
              onPressed: () {},
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 8,
          ),
          ListTile(
            leading: const Icon(Icons.token),
            title: const Text('Firebase Token'),
            subtitle: _FireBaseToken(),
            tileColor: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            trailing: const Icon(Icons.copy),
            onTap: () {},
          ),
        ],
      );
}

class _FireBaseToken extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FutureBuilder<String?>(
        future: FirebaseMessaging.instance.getToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          } else if (snapshot.hasData) {
            return Text(
              snapshot.data!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            );
          }
          return const SizedBox.shrink();
        },
      );
}

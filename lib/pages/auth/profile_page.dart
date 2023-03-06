import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_firebase/routing/routes/home_routes.dart';
import 'package:go_firebase/services/remote_config_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => ProfileScreen(
        avatarPlaceholderColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          title: const Text('Your Profile'),
        ),
        children: [
          _FireBaseInstallationId(),
          if (RemoteConfigService.instance.hasEditorSuperPowers) ...[
            const SizedBox(
              height: 8,
            ),
            ListTile(
              leading: const Icon(Icons.star_rounded),
              title: const Text('Editor Menu'),
              tileColor: Theme.of(context).colorScheme.surfaceVariant,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                EditorPageData().go(context);
              },
            ),
          ],
        ],
      );
}

class _FireBaseInstallationId extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FutureBuilder<String?>(
        future: FirebaseInstallations.instance.getId(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          } else if (snapshot.hasData) {
            return ListTile(
              leading: const Icon(Icons.key),
              title: const Text('Firebase Installation ID'),
              subtitle: Text(
                snapshot.data!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              dense: true,
              tileColor: Theme.of(context).colorScheme.surfaceVariant,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              trailing: const Icon(Icons.copy),
              onTap: () async {
                await Clipboard.setData(
                  ClipboardData(text: snapshot.data!),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      );
}

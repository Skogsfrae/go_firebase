import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_firebase/routing/router.dart';
import 'package:go_firebase/services/dynamic_link_service.dart';
import 'package:go_router/go_router.dart';

class EditorPage extends StatelessWidget {
  const EditorPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Editor page'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Utils for an editor to use navigation without stressing out'
              ' too much a developer.',
            ),
            const SizedBox(
              height: 8,
            ),
            _FireBaseToken(),
            const SizedBox(
              height: 8,
            ),
            _NavigationOverlaySwitch(),
          ],
        ),
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
            return ListTile(
              leading: const Icon(Icons.token),
              title: const Text('Firebase Token'),
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

class _NavigationOverlaySwitch extends StatefulWidget {
  @override
  State<_NavigationOverlaySwitch> createState() =>
      _NavigationOverlaySwitchState();
}

class _NavigationOverlaySwitchState extends State<_NavigationOverlaySwitch> {
  static OverlayEntry? _currentOverlayEntry;
  bool overlayActive = _currentOverlayEntry != null;

  void _onChanged(bool value) {
    setState(() {
      overlayActive = value;
    });

    if (overlayActive) {
      _currentOverlayEntry = OverlayEntry(
        builder: (context) {
          return Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Material(
                  elevation: 4,
                  color: Theme.of(context)
                      .colorScheme
                      .outlineVariant
                      .withOpacity(.7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    dense: true,
                    leading: const Icon(Icons.navigation),
                    title: const Text('Current route'),
                    subtitle: Text(
                      GoRouter.of(context).location,
                    ),
                    trailing: const Icon(Icons.copy),
                    onTap: () async {
                      final dynamicLink = await DynamicLinkService.instance
                          .getDynamicLinkFromLocation(
                        GoRouter.of(context).location,
                      );
                      await Clipboard.setData(
                        ClipboardData(text: dynamicLink),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      );
      Overlay.of(context).insert(_currentOverlayEntry!);
    } else {
      _currentOverlayEntry?.remove();
    }
  }

  @override
  Widget build(BuildContext context) => SwitchListTile.adaptive(
        title: const Text('Navigation overlay'),
        subtitle: const Text(
          'This option will activate an overlay with current route and a button'
          ' to copy its data and dynamic link.',
        ),
        secondary: const Icon(Icons.navigation),
        dense: true,
        tileColor: Theme.of(context).colorScheme.surfaceVariant,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onChanged: _onChanged,
        value: overlayActive,
      );
}

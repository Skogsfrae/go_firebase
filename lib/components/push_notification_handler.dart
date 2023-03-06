import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_firebase/routing/router.dart';
import 'package:go_firebase/services/push_notification_service.dart';

class PushNotificationHandler extends StatefulWidget {
  final Widget child;

  const PushNotificationHandler({required this.child, super.key});

  @override
  State<PushNotificationHandler> createState() =>
      _PushNotificationHandlerState();
}

class _PushNotificationHandlerState extends State<PushNotificationHandler> {
  @override
  void initState() {
    super.initState();
    PushNotificationService.instance.notificationCallback =
        _handlePushNotification;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _handlePushNotification(RemoteMessage message, bool isForeground) {
    debugPrint(message.data.toString());
    final String? action = message.data["action"];
    if (isForeground) {
      _showCustomNotifcation(message);
    } else {
      switch (action) {
        case "navigation":
          if (message.data['route'] != null) {
            final route = Uri.parse(message.data['route']).replace(
              scheme: pushNotificationScheme,
            );

            GoFirebaseRouter.instance.router.go(route.toString());
          }
          break;
        default:
          return;
      }
    }
  }

  void _showCustomNotifcation(RemoteMessage message) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 30,
        left: 10,
        right: 10,
        child: Material(
          color: Theme.of(context).colorScheme.outlineVariant,
          borderRadius: BorderRadius.circular(10),
          elevation: 20,
          child: ListTile(
            onTap: () {
              _handlePushNotification(message, false);
            },
            title: Text(
              message.notification?.title ?? "",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            subtitle: Text(
                    message.notification?.body ?? "",
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
          ),
        ),
      ),
    );
    overlayState.insert(overlayEntry);
    await Future.delayed(
      const Duration(seconds: 3),
    );
    overlayEntry.remove();
  }
}

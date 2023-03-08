import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_firebase/services/auth/auth_service.dart';
import 'package:logging/logging.dart';

typedef NotificationCallback = void Function(
  RemoteMessage message, {
  required bool isForeground,
});

class PushNotificationService {
  static PushNotificationService? _instance;
  static PushNotificationService get instance =>
      _instance ??= PushNotificationService._();

  String? _firebaseMessagingToken;
  String? get firebaseMessagingToken => _firebaseMessagingToken;

  List<StreamSubscription>? _subscriptions;

  final _logger = Logger('PushNotificationService');

  NotificationCallback? _notificationCallback;
  NotificationCallback? get notificationCallback => _notificationCallback;
  set notificationCallback(NotificationCallback? callback) {
    _notificationCallback = callback;
    _logger.info('Setting up notification handler.');
  }

  PushNotificationService._() {
    _init();
  }

  void _init() async {
    _subscriptions?.forEach((s) => s.cancel());
    _subscriptions = [
      FirebaseMessaging.instance.onTokenRefresh.listen(_onTokenRefresh),
      FirebaseMessaging.onMessage.listen(
        (message) => notificationCallback?.call(message, isForeground: true),
      ),
      FirebaseMessaging.onMessageOpenedApp.listen(
        (message) => notificationCallback?.call(message, isForeground: false),
      ),
    ];
    setupToken();
  }

  Future<String?> setupToken() async {
    final isAuthorized = await isAuthorizationGranted();

    String? token;

    if (isAuthorized) {
      if (AuthService.instance.loggedIn) {
        _firebaseMessagingToken = await FirebaseMessaging.instance.getToken();
      }
    } else {
      _firebaseMessagingToken = null;
    }
    _logger.info("FIREBASE MESSAGING TOKEN : $_firebaseMessagingToken");

    return token;
  }

  Future<bool> isAuthorizationGranted() async {
    final settings = await FirebaseMessaging.instance.getNotificationSettings();
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  void _onTokenRefresh(String? token) {
    _firebaseMessagingToken = token;
    _logger.info("REFRESH FIREBASE MESSAGING TOKEN : $_firebaseMessagingToken");
  }
}

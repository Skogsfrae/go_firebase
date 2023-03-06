import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:go_firebase/go_firebase_app.dart';
import 'package:go_firebase/services/remote_config_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: 'GoFirebase',
    options: const FirebaseOptions(
      apiKey: String.fromEnvironment('FIREBASE_API_KEY'),
      appId: String.fromEnvironment('FIREBASE_APP_ID'),
      messagingSenderId: String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID'),
      projectId: String.fromEnvironment('FIREBASE_PROJECT_ID'),
      authDomain: bool.hasEnvironment('FIREBASE_AUTH_DOMAIN')
          ? String.fromEnvironment('FIREBASE_AUTH_DOMAIN')
          : null,
      storageBucket: bool.hasEnvironment('FIREBASE_STORAGE_BUCKET')
          ? String.fromEnvironment('FIREBASE_STORAGE_BUCKET')
          : null,
      measurementId: bool.hasEnvironment('FIREBASE_MEASUREMENT_ID')
          ? String.fromEnvironment('FIREBASE_MEASUREMENT_ID')
          : null,
    ),
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  RemoteConfigService.instance;

  runApp(const GoFirebaseApp());
}

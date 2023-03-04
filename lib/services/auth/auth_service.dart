import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  AuthService._() {
    notifyListeners();
    _streamSubscription = FirebaseAuth.instance.userChanges().listen(
          (event) => notifyListeners(),
        );
  }

  static AuthService? _instance;
  static AuthService get instance => _instance ??= AuthService._();

  static List<AuthProvider> authProviders = [
    EmailAuthProvider(),
  ];

  late final StreamSubscription _streamSubscription;

  bool get loggedIn => FirebaseAuth.instance.currentUser != null;

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}

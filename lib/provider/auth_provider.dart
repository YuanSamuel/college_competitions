import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  bool _loggedIn = false;

  bool get loggedIn => _loggedIn;

  AuthProvider() {
    setUpStream();
  }

  Future<void> setUpStream() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      print('update');
      print(user);
      if (user != null) {
        _loggedIn = true;
      } else {
        _loggedIn = false;
      }
      notifyListeners();
    });
  }
}

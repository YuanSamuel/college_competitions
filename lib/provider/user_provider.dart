import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_competitions/models/User.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  UserProvider() {
    setUpListener();
  }

  Future<void> setUpListener() async {
    auth.FirebaseAuth.instance.userChanges().listen((auth.User? firebaseUser) {
      if (firebaseUser == null) {
        _user = null;
      } else {
        FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseUser.uid)
            .snapshots()
            .listen((DocumentSnapshot snapshot) {
          _user = User.fromSnapshot(snapshot);
          notifyListeners();
        });
      }
    });
  }
}

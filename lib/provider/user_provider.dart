import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_competitions/models/College.dart';
import 'package:college_competitions/models/User.dart';
import 'package:college_competitions/services/college_data_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  College? _college;

  User? get user => _user;
  College? get college => _college;

  Future<void> setUpListener(String id) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .snapshots()
        .listen((DocumentSnapshot snapshot) async {
      try {
        _user = User.fromSnapshot(snapshot);
        notifyListeners();
      } catch (e) {
        print(e);
      }
    });
  }


}

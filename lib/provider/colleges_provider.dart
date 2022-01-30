import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_competitions/models/College.dart';
import 'package:flutter/foundation.dart';

class CollegesProvider extends ChangeNotifier {
  List<College>? _colleges;

  List<College>? get colleges => _colleges;

  CollegesProvider() {
    setUpStream();
  }

  Future<void> setUpStream() async {
    FirebaseFirestore.instance
        .collection('colleges')
        .snapshots()
        .listen((QuerySnapshot query) {
      _colleges = [];
      for (DocumentSnapshot snapshot in query.docs) {
        _colleges!.add(College.fromSnapshot(snapshot));
      }
      notifyListeners();
    });
  }
}

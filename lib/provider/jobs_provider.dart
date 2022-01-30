import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_competitions/models/Job.dart';
import 'package:college_competitions/models/User.dart';
import 'package:flutter/foundation.dart';

class JobsProvider extends ChangeNotifier {
  List<Job> _jobs = [];

  List<Job> get jobs => _jobs;

  Future<void> setUpListeners(User user) async {
    FirebaseFirestore.instance
        .collection('jobs')
        .where('college', isEqualTo: user.college)
        .snapshots()
        .listen((QuerySnapshot query) {
      _jobs = [];
      for (DocumentSnapshot snapshot in query.docs) {
        _jobs.add(Job.fromSnapshot(snapshot));
      }
      notifyListeners();
    });
  }
}

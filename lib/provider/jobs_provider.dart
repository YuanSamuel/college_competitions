import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_competitions/models/Job.dart';
import 'package:college_competitions/models/User.dart';
import 'package:flutter/foundation.dart';

class JobsProvider extends ChangeNotifier {
  List<Job> _allJobs = [];
  List<Job> _userJobs = [];

  List<Job> get allJobs => _allJobs;
  List<Job> get userJobs => _userJobs;

  Future<void> setUpListeners(User user) async {
    FirebaseFirestore.instance
        .collection('jobs')
        .where('college', isEqualTo: user.college)
        .snapshots()
        .listen((QuerySnapshot query) {
      _userJobs = [];
      for (DocumentSnapshot snapshot in query.docs) {
        _userJobs.add(Job.fromSnapshot(snapshot));
      }
      notifyListeners();
    });

    FirebaseFirestore.instance
        .collection('jobs')
        .snapshots()
        .listen((QuerySnapshot query) {
      _allJobs = [];
      for (DocumentSnapshot snapshot in query.docs) {
        _allJobs.add(Job.fromSnapshot(snapshot));
      }
      notifyListeners();
    });
  }
}

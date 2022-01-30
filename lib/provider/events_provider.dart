import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_competitions/models/Event.dart';
import 'package:college_competitions/models/User.dart';
import 'package:flutter/foundation.dart';

class EventsProvider extends ChangeNotifier {
  List<Event> _userEvents = [];
  List<Event> _allEvents = [];

  List<Event> get userEvents => _userEvents;
  List<Event> get allEvents => _allEvents;

  Future<void> setUpListeners(User user) async {
    FirebaseFirestore.instance
        .collection('events')
        .where('college', isEqualTo: user.college)
        .where('registered', arrayContains: user.reference!.id)
        .snapshots()
        .listen((QuerySnapshot query) {
      _userEvents = [];
      for (DocumentSnapshot snapshot in query.docs) {
        _userEvents.add(Event.fromSnapshot(snapshot));
      }
      notifyListeners();
    });

    FirebaseFirestore.instance
        .collection('events')
        .where('college', isEqualTo: user.college)
        .snapshots()
        .listen((QuerySnapshot query) {
      _allEvents = [];
      for (DocumentSnapshot snapshot in query.docs) {
        _allEvents.add(Event.fromSnapshot(snapshot));
      }
      notifyListeners();
    });
  }
}

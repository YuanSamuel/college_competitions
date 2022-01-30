import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_competitions/models/Event.dart';
import 'package:college_competitions/models/User.dart';
import 'package:flutter/foundation.dart';

class EventsProvider extends ChangeNotifier {
  List<Event> _events = [];

  List<Event> get events => _events;

  Future<void> setUpListeners(User user) async {
    FirebaseFirestore.instance
        .collection('events')
        .where('college', isEqualTo: user.college)
        .snapshots()
        .listen((QuerySnapshot query) {
          _events = [];
          for (DocumentSnapshot snapshot in query.docs) {
            _events.add(Event.fromSnapshot(snapshot));
          }
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Job {
  String name;
  String college;
  String description;
  String organizerId;
  int capacity;
  int points;
  GeoPoint location;
  Timestamp date;
  List<String> interests;
  List<String> registered;

  DocumentReference? reference;

  Job(
      this.name,
      this.college,
      this.description,
      this.organizerId,
      this.capacity,
      this.points,
      this.location,
      this.date,
      this.interests,
      this.registered,
      {this.reference});

  Job.fromSnapshot(DocumentSnapshot snapshot)
      : name = snapshot.get('name'),
        college = snapshot.get('college'),
        description = snapshot.get('description'),
        organizerId = snapshot.get('organizerId'),
        capacity = snapshot.get('capacity'),
        points = snapshot.get('points'),
        location = snapshot.get('location'),
        date = snapshot.get('date'),
        interests = List<String>.from(snapshot.get('interests')),
        registered = List<String>.from(snapshot.get('registered')),
        reference = snapshot.reference;

  Map<String, dynamic> toJson() => {
        'name': name,
        'college': college,
        'description': description,
        'organizerId': organizerId,
        'capacity': capacity,
        'points': points,
        'location': location,
        'date': date,
        'interests': interests,
        'registered': registered
      };
}

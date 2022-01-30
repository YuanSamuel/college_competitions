import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String college;
  String email;
  String profileUrl;
  int points;
  List<String> interests;

  DocumentReference reference;

  User(this.name, this.college, this.email, this.profileUrl, this.points,
      this.interests, this.reference);

  User.fromSnapshot(DocumentSnapshot snapshot)
      : name = snapshot.get('name'),
        college = snapshot.get('college'),
        email = snapshot.get('email'),
        profileUrl = snapshot.get('profileUrl'),
        points = snapshot.get('points'),
        interests = List<String>.from(snapshot.get('interests')),
        reference = snapshot.reference;

  Map<String, dynamic> toJson() => {
        'name': name,
        'college': college,
        'email': email,
        'profileUrl': profileUrl,
        'points': points,
        'interests': interests,
      };
}

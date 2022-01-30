import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

class College {
  String name;
  String logoUrl;
  int points;

  DocumentReference? reference;

  College(this.name, this.logoUrl, this.points, {this.reference});

  College.fromSnapshot(DocumentSnapshot snapshot)
      : name = snapshot.get('name'),
        logoUrl = snapshot.get('logoUrl'),
        points = snapshot.get('points'),
        reference = snapshot.reference;

  Map<String, dynamic> toJson() => {
        'name': name,
        'logoUrl': logoUrl,
        'points': points,
      };
}

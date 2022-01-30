import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_competitions/models/ChooseCollege.dart';
import 'package:college_competitions/models/College.dart';
import 'package:college_competitions/models/Event.dart';
import 'package:college_competitions/models/Job.dart';
import 'package:college_competitions/models/User.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class FirebaseService {
  Future<bool> signUp(String email, String password) async {
    try {
      await auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await auth.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {}
  }

  Future<void> signOut() async {
    await auth.FirebaseAuth.instance.signOut();
  }

  Future<void> createUser(User user) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.FirebaseAuth.instance.currentUser!.uid)
        .set(user.toJson());
  }

  Future<void> createEvent(Event event) async {
    await FirebaseFirestore.instance.collection('events').add(event.toJson());
  }

  Future<void> createJob(Job job) async {
    await FirebaseFirestore.instance.collection('job').add(job.toJson());
  }

  Future<User> getUserFromId(String id) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    return User.fromSnapshot(snapshot);
  }

  Future<void> registerForEvent(Event event) async {
    await event.reference?.update({
      'registered':
          FieldValue.arrayUnion([auth.FirebaseAuth.instance.currentUser!.uid]),
    });
  }

  Future<void> registerForJob(Job job) async {
    await job.reference?.update({
      'registered':
          FieldValue.arrayUnion([auth.FirebaseAuth.instance.currentUser!.uid]),
    });
  }

  Future<String> uploadProfilePicture(File file) async {
    print('start upload');
    FirebaseStorage storage = FirebaseStorage.instance;
    TaskSnapshot task = await storage
        .ref('profilePictures/${basename(file.path)}')
        .putFile(file);
    String downloadURL = await task.ref.getDownloadURL();
    print('finish');
    return downloadURL;
  }

  Future<String> uploadCollegeLogo(String name, Uint8List? data) async {
    if (data != null) {
      FirebaseStorage storage = FirebaseStorage.instance;
      TaskSnapshot task = await storage.ref('collegeLogos/$name').putData(data);
      String downloadURL = await task.ref.getDownloadURL();
      return downloadURL;
    } else {
      return '';
    }
  }

  Future<void> updateCollege(ChooseCollege college) async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('colleges')
        .where('name', isEqualTo: college.name)
        .get();
    if (query.size == 0) {
      String url = await uploadCollegeLogo(college.name, college.logo);
      College newCollege = College(college.name, url, 0);
      FirebaseFirestore.instance
          .collection('colleges')
          .doc(college.name)
          .set(newCollege.toJson());
    }
  }

  Future<User> getOrganizer(String id) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    return User.fromSnapshot(snapshot);
  }
}

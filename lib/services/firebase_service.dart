import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_competitions/models/Event.dart';
import 'package:college_competitions/models/Job.dart';
import 'package:college_competitions/models/User.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class FirebaseService {
  Future<void> signUp(String email, String password) async {
    try {
      await auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {}
  }

  Future<void> signOut() async {
    await auth.FirebaseAuth.instance.signOut();
  }

  Future<void> createUser(User user) async {
    await FirebaseFirestore.instance.collection('users').add(user.toJson());
  }

  Future<void> createEvent(Event event) async {
    await FirebaseFirestore.instance.collection('events').add(event.toJson());
  }

  Future<void> createJob(Job job) async {
    await FirebaseFirestore.instance.collection('job').add(job.toJson());
  }
}

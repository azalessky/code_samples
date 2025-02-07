import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:student_planner/models/models.dart';
import 'package:student_planner/repositories/repositories.dart';

class RemoteRepository extends RemoteListener {
  final String rootCollection;
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  RemoteRepository._(this.rootCollection);

  static Future<RemoteRepository> getInstance(String rootCollection) async {
    return RemoteRepository._(rootCollection);
  }

  @override
  Future<DocumentSnapshot<UserData>?> loadUserDocument() async {
    final userId = auth.currentUser?.uid;
    if (userId == null) return null;

    final collection = firestore.collection(rootCollection);
    final doc = await collection.doc(userId).get();
    return doc;
  }

  @override
  Future<UserData?> loadUserData() async {
    final doc = await loadUserDocument();
    return doc?.data();
  }

  Future<void> saveUserData(UserData data) async {
    final doc = await loadUserDocument();
    if (doc == null) return;

    final ref = doc.reference;
    return doc.exists ? ref.update(data) : ref.set(data);
  }

  Future<void> deleteUserData() async {
    final doc = await loadUserDocument();
    await doc?.reference.delete();
  }
}

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/services/services.dart';

class FirestoreService {
  final String? name;

  final _firestore = FirebaseFirestore.instance;
  String? get userId => FirebaseAuth.instance.currentUser?.uid;

  FirestoreService([this.name]);

  String? get documentPath {
    final uid = userId;
    if (uid == null) return null;

    final key = AppSettings.isProduction ? RepositoryKeys.prodKey : RepositoryKeys.devKey;
    return name == null ? '$key/$uid' : '$key/$uid/$name';
  }

  DocumentReference<JsonData>? get document {
    final path = documentPath;
    return path == null ? null : _firestore.doc(path);
  }

  CollectionReference<JsonData>? get collection {
    final path = documentPath;
    return path == null ? null : _firestore.collection(path);
  }

  Stream<DocumentSnapshot<JsonData>> snapshots() {
    final doc = document;
    if (doc == null) return const Stream.empty();

    return doc.snapshots().map((s) => s).handleError(logError);
  }

  Future<bool> exists() async {
    try {
      final doc = document;
      if (doc == null) return false;

      _logMessage('exists');

      final snapshot = await doc.get();
      return snapshot.exists;
    } catch (e, st) {
      logError(e, st);
      rethrow;
    }
  }

  Future<JsonData?> get(Source source) async {
    try {
      final doc = document;
      if (doc == null) return null;

      _logMessage('get');

      final snapshot = await doc.get(GetOptions(source: source));
      return snapshot.data();
    } catch (e, st) {
      logError(e, st);
      rethrow;
    }
  }

  Future<void> set(JsonData data, [SetOptions? options]) async {
    try {
      final doc = document;
      if (doc == null) return;

      _logMessage('set');
      await doc.set(data, options);
    } catch (e, st) {
      logError(e, st);
      rethrow;
    }
  }

  void _logMessage(String method) {
    debugPrint('FirestoreService.$method: ${document?.path}');
  }
}

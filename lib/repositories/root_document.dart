import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/services/services.dart';

class RootDocument {
  final FirestoreService firestore;
  final VoidCallback onDeleted;

  StreamSubscription? _subscription;

  RootDocument(this.onDeleted) : firestore = FirestoreService();

  void subscribe() {
    if (firestore.userId == null) return;

    _logMessage('subscribe');

    _subscription?.cancel();
    _subscription = firestore
        .snapshots()
        .where((s) => !s.metadata.hasPendingWrites)
        .where((s) => !s.metadata.isFromCache)
        .where((s) => !s.exists)
        .listen((_) => _fireDelete());
  }

  void unsubscribe() {
    _logMessage('unsubscribe');

    _subscription?.cancel();
    _subscription = null;
  }

  Future<bool> exists() async {
    return await firestore.exists();
  }

  Future<void> create() async {
    await firestore.set(_makeData(true));
  }

  Future<void> touch() async {
    await firestore.set(_makeData(false), SetOptions(merge: true));
  }

  JsonData _makeData(bool create) {
    return {
      if (create) 'createdAt': FieldValue.serverTimestamp(),
      'activeAt': FieldValue.serverTimestamp(),
    };
  }

  void _fireDelete() {
    _logMessage('onDeleted');
    onDeleted.call();
  }

  void _logMessage(String method) {
    debugPrint('BaseRepository.$method: ${firestore.name}');
  }
}

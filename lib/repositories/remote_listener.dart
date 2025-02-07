import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:student_planner/models/models.dart';

abstract class RemoteListener {
  StreamController<UserData?>? _controller;
  StreamSubscription? _subscription;
  UserData? _userData;

  Stream<UserData?> get updates => _controller!.stream;
  UserData? get userData => _userData;

  Future<DocumentSnapshot<UserData>?> loadUserDocument();
  Future<UserData?> loadUserData();

  void initialize() {
    _controller = StreamController<UserData?>.broadcast();
  }

  void dispose() {
    unsubscribe();
    _controller?.close();
    _controller = null;
  }

  Future<void> sync({bool notify = true}) async {
    final data = await loadUserData();
    if (data != null) {
      _userData = data;
      if (notify) _controller!.add(data);
    }
  }

  Future<void> subscribe() async {
    final doc = await loadUserDocument();
    if (doc == null) return;

    _subscription?.cancel();
    _subscription = doc.reference.snapshots().listen(
      (snapshot) {
        if (!snapshot.metadata.hasPendingWrites && !snapshot.metadata.isFromCache) {
          _controller!.add(snapshot.exists ? snapshot.data() ?? {} : null);
        }
      },
    );
  }

  Future<void> unsubscribe() async {
    _subscription?.cancel();
    _subscription = null;
    _userData = null;
  }
}

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/repositories/repositories.dart';
import 'package:student_planner/services/services.dart';

abstract class BaseRepository<T> {
  static final totalUpdates = ValueNotifier<int>(0);

  final LocalStorage storage;
  final FirestoreService firestore;

  final T Function(dynamic) fromJson;
  final dynamic Function(T) toJson;

  StreamSubscription? _subscription;
  StreamController<T>? _controller;
  Stream<T> get stream => _controller?.stream ?? const Stream.empty();

  T? _state;
  T? get state => _state;

  BaseRepository({
    required String name,
    required this.fromJson,
    required this.toJson,
  }) : storage = LocalStorage(name),
       firestore = FirestoreService(name);

  void subscribe() {
    if (firestore.userId == null) return;

    _logMessage('subscribe');

    _controller?.close();
    _controller = StreamController<T>.broadcast();

    _subscription?.cancel();
    _subscription = firestore
        .snapshots()
        .where((s) => !s.metadata.hasPendingWrites)
        .where((s) => !s.metadata.isFromCache)
        .map((s) => s.data())
        .where((data) => data != null)
        .listen((data) => _handleFirestore(data!));
  }

  void unsubscribe() {
    _logMessage('unsubscribe');

    _controller?.close();
    _controller = null;
    _subscription?.cancel();
    _subscription = null;
    _state = null;
  }

  Future<bool> exists() async {
    return await firestore.exists();
  }

  Future<void> load(LoadSource source) async {
    try {
      final data = source == .local ? await storage.read() : await firestore.get(Source.server);
      if (data == null) return _state = null;

      _state = fromJson(data);
      if (source == .remote) await storage.write(data);
    } catch (e, st) {
      logError(e, st);
    }
  }

  Future<void> save(T value, SaveTarget target) async {
    final equals = const DeepCollectionEquality().equals(value, _state);
    if (equals && target == .auto) return;

    _state = value;
    final data = toJson(value);

    if (target == .auto || target == .local) await storage.write(data);
    if (target == .auto || target == .remote) await firestore.set(toJson(value));
  }

  Future<void> clear() async {
    await storage.delete();
    _state = null;
  }

  void _handleFirestore(JsonData data) {
    _logMessage('handleData');

    try {
      final value = fromJson(data);
      if (const DeepCollectionEquality().equals(value, _state)) return;

      _state = value;
      _controller?.add(value);

      totalUpdates.value++;
      storage.write(data);
    } catch (e, st) {
      logError(e, st);
    }
  }

  void _logMessage(String method) {
    debugPrint('$runtimeType.$method');
  }
}

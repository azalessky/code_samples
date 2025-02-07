import 'dart:async';

import 'package:collection/collection.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/repositories/repositories.dart';

enum RepositoryEvent {
  dataUpdated,
  userDeleted,
}

class CachedRepository {
  final LocalRepository local;
  final RemoteRepository remote;

  StreamController<RepositoryEvent>? _controller;
  StreamSubscription? _subscription;
  UserData? _data;

  CachedRepository._({
    required this.local,
    required this.remote,
  });

  Stream<RepositoryEvent> get updates => _controller!.stream;

  static Future<CachedRepository> getInstance(String rootCollection) async {
    final instance = CachedRepository._(
      local: await LocalRepository.getInstance(),
      remote: await RemoteRepository.getInstance(rootCollection),
    );
    await instance.initialize();
    return instance;
  }

  Future<void> initialize() async {
    remote.initialize();
    _data = await local.loadUserData() ?? {};
    _controller = StreamController<RepositoryEvent>.broadcast();
    _subscription = remote.updates.listen((data) => _handleDataUpdate(data, true));
  }

  void dispose() {
    remote.dispose();
    _subscription?.cancel();
    _subscription = null;
    _controller?.close();
    _controller = null;
    _data = null;
  }

  Future<void> subscribe() async {
    await remote.subscribe();
  }

  Future<void> unsubscribe() async {
    await remote.unsubscribe();
  }

  T? getObject<T>(SerializableBase provider) {
    final json = _data?[provider.jsonKey];
    return json == null ? null : provider.deserializer(json);
  }

  List<T>? getObjectList<T>(SerializableBase provider) {
    final json = _data?[provider.jsonKey];
    return json?.map<T>((e) => provider.deserializer(e) as T).toList();
  }

  Future<void> saveData() async {
    final data = serializableManager.serialize();
    await local.saveUserData(data);
    await remote.saveUserData(data);
    _data = data;
  }

  Future<void> syncData({bool notify = true}) async {
    final data = await remote.loadUserData();
    if (data == null) {
      await saveData();
    } else {
      await _handleDataUpdate(data, notify);
    }
  }

  Future<void> deleteData({bool deleteRemote = true}) async {
    await local.deleteUserData();
    if (deleteRemote) await remote.deleteUserData();
    _data = null;
  }

  Future<void> _handleDataUpdate(UserData? data, bool notify) async {
    if (DeepCollectionEquality().equals(data, _data)) return;

    if (data != null) {
      await local.saveUserData(data);
      serializableManager.deserialize(data);
      if (notify) _controller!.add(RepositoryEvent.dataUpdated);
    } else {
      _controller!.add(RepositoryEvent.userDeleted);
    }
    _data = data;
  }
}

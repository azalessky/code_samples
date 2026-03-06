import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:riverpod/riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/controllers/controllers.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/repositories/repositories.dart';
import 'package:student_planner/services/services.dart';

class SaveableEntry {
  final ProviderBase provider;
  final ProviderListenable notifier;

  const SaveableEntry(this.provider, this.notifier);
}

final saveableEntries = [
  SaveableEntry(assignmentsProvider, assignmentsProvider.notifier),
  SaveableEntry(bellsProvider, bellsProvider.notifier),
  SaveableEntry(gradesProvider, gradesProvider.notifier),
  SaveableEntry(labelsProvider, labelsProvider.notifier),
  SaveableEntry(notesProvider, notesProvider.notifier),
  SaveableEntry(periodsProvider, periodsProvider.notifier),
  SaveableEntry(settingsProvider, settingsProvider.notifier),
  SaveableEntry(subjectsProvider, subjectsProvider.notifier),
  SaveableEntry(teachersProvider, teachersProvider.notifier),
  SaveableEntry(termsProvider, termsProvider.notifier),
];

final List<BaseRepository> saveableRepositories = [
  assignmentsRepository,
  bellsRepository,
  gradesRepository,
  labelsRepository,
  notesRepository,
  periodsRepository,
  settingsRepository,
  subjectsRepository,
  teachersRepository,
  termsRepository,
];

class ProfileManager {
  final ProviderContainer container;
  late final RootDocument _rootDocument;

  ProfileManager._(this.container);

  static ProfileManager getInstance(ProviderContainer container) {
    return ProfileManager._(container)..initialize();
  }

  void initialize() {
    BaseRepository.totalUpdates.addListener(_handleDataUpdate);
    _rootDocument = RootDocument(() => deleteData(false));
  }

  void dispose() {
    BaseRepository.totalUpdates.removeListener(_handleDataUpdate);
    _unsubscribeRepositories();
    _rootDocument.unsubscribe();
  }

  Future<bool> signInUser() async {
    return _handleException(() async {
      return await AuthService.instance.signIn(onUserChange: _unsubscribeRepositories);
    }, defaultValue: false);
  }

  Future<bool> signInAnonymously() async {
    return _handleException(() async {
      return await AuthService.instance.signInAnonymously();
    }, defaultValue: false);
  }

  Future<void> signOutUser() async {
    return _handleException(() async {
      _unsubscribeRepositories();
      await AuthService.instance.signOut();
      await _clearRepositories();
      _invalidateProviders();
      _resetNavigation();
    });
  }

  Future<void> restoreSession() async {
    return _handleException(() async {
      await _loadRepositories(.local);

      // TODO: Remove this code after full migration to 2.27
      final futures = <Future>[];
      for (final repository in saveableRepositories) {
        if (repository.state == null) futures.add(repository.load(LoadSource.remote));
      }
      await Future.wait(futures);

      // TODO: Remove this code after full migration to 2.28
      final config = container.read(settingsProvider).grades;
      final grades = container.read(gradesProvider);
      final notifier = container.read(gradesProvider.notifier);
      final migrated = MigrationController().migrateAttendanceMarks(config, grades);
      if (migrated.isNotEmpty) {
        debugPrint('ProfileManager.restoreSession: Saving migrated grades...');
        notifier.removeAll();
        notifier.addItems(migrated);
        await notifier.save();
      }

      _rootDocument.touch();
      _subscribeRepositories();
      _invalidateProviders();
    });
  }

  Future<void> syncData() async {
    return _handleException(
      () async {
        if (await _rootDocument.exists()) {
          await _loadRepositories(.remote);
          await _rootDocument.touch();
          _invalidateProviders();
          messages.showMessage(UserMessage.dataUpdated);
        } else {
          await _rootDocument.create();
          await _saveProviders(.remote);
        }
        _subscribeRepositories();
      },
    );
  }

  Future<void> deleteData(bool deleteUser) async {
    return _handleException(() async {
      OAuthCredential? credential;

      if (deleteUser && AuthService.instance.hasUser) {
        credential = await AuthService.instance.startDeleteUser();
        if (credential == null) return;
      }

      _unsubscribeRepositories();
      await _deleteOrSignOut(credential, deleteUser);
      await _clearRepositories();
      _invalidateProviders();
      _resetNavigation();

      messages.showMessage(UserMessage.profileDeleted);
    });
  }

  Future<bool> checkUser() async {
    try {
      await AuthService.instance.reloadUser();
    } on AuthException catch (e) {
      if (e.userNotFound) await deleteData(false);
    }
    return AuthService.instance.currentUser != null;
  }

  Future<void> _deleteOrSignOut(OAuthCredential? credential, bool deleteUser) async {
    if (deleteUser) {
      await AuthService.instance.completeDeleteUser(credential);
    } else {
      await AuthService.instance.signOut();
    }
  }

  void _subscribeRepositories() {
    for (final repository in saveableRepositories) {
      repository.subscribe();
    }
    _rootDocument.subscribe();
  }

  void _unsubscribeRepositories() {
    for (final repository in saveableRepositories) {
      repository.unsubscribe();
    }
    _rootDocument.unsubscribe();
  }

  Future<void> _loadRepositories(LoadSource source) async {
    await Future.wait([
      for (final repository in saveableRepositories) repository.load(source),
    ]);
  }

  Future<void> _clearRepositories() async {
    await Future.wait([
      for (final repository in saveableRepositories) repository.clear(),
    ]);
  }

  Future<void> _saveProviders(SaveTarget target) async {
    await Future.wait(
      saveableEntries.map((entry) {
        final notifier = container.read(entry.notifier);
        if (notifier is! SaveableBase) return Future.value();

        final state = container.read(entry.provider);
        return notifier.repository.save(state, target);
      }),
    );
  }

  void _invalidateProviders() {
    for (final entry in saveableEntries) {
      final notifier = container.read(entry.notifier);
      if (notifier is SaveableBase) notifier.invalidate();
    }
  }

  void _resetNavigation() {
    final router = container.read(routerProvider);
    router.replaceAll([const ScheduleRoute()]);
  }

  void _handleDataUpdate() {
    messages.showMessage(
      UserMessage.dataUpdated,
      debounce: AnimationSettings.messageDebounce,
    );
  }

  Future<T> _handleException<T>(
    Future<T> Function() action, {
    T? defaultValue,
    void Function(AuthException)? handler,
  }) async {
    try {
      return await action();
    } on AuthException catch (e) {
      if (handler == null) {
        final message = e.networkError ? UserMessage.noConnection : UserMessage.errorOccurred;
        messages.showMessage(message);
      } else {
        handler(e);
      }
    } on Exception {
      messages.showMessage(UserMessage.errorOccurred);
    }
    return defaultValue as T;
  }
}

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/repositories/repositories.dart';
import 'package:student_planner/services/services.dart';

class ProfileManager {
  final providers = [
    assignmentsProvider,
    bellsProvider,
    gradesProvider,
    notesProvider,
    periodsProvider,
    settingsProvider,
    subjectsProvider,
    teachersProvider,
    termsProvider,
  ];

  Future<void> signInUser() async {
    return await _handleException(() async {
      if (await authService.signIn()) {
        await cachedRepository.subscribe();
        await cachedRepository.syncData(notify: false);
        showSnackBar(SnackBarStyle.info, 'Message.SyncEnabled'.tr());
      }
    });
  }

  Future<void> signOutUser(BuildContext context) async {
    return await _handleException(() async {
      await cachedRepository.unsubscribe();
      await authService.signOut();
      showSnackBar(SnackBarStyle.info, 'Message.SyncDisabled'.tr());
    });
  }

  Future<void> loadData(BuildContext context) async {
    return await _handleException(() async {
      _addProviders(context);
      await authService.reloadUser();
      await cachedRepository.subscribe();
      await cachedRepository.syncData();
    }, (e) {
      if (e.code == 'user-not-found') {
        if (context.mounted) deleteData(context, false);
      }
    });
  }

  Future<void> deleteData(BuildContext context, bool deleteUser) async {
    return await _handleException(() async {
      final credential = deleteUser ? await authService.startDeleteUser() : null;
      if (deleteUser && credential == null) return;

      await cachedRepository.unsubscribe();
      await cachedRepository.deleteData(deleteRemote: deleteUser);

      if (deleteUser) {
        await authService.completeDeleteUser(credential!);
      } else {
        await authService.signOut();
      }

      if (context.mounted) _resetProviders(context);
      await cachedRepository.saveData();

      showSnackBar(SnackBarStyle.info, 'Message.ProfileDeleted'.tr());
    });
  }

  void _addProviders(BuildContext context) {
    final container = ProviderScope.containerOf(context);
    for (final provider in providers) {
      final notifier = container.read(provider.notifier);
      if (notifier is SerializableBase) {
        serializableManager.addProvider(notifier);
      }
    }
  }

  void _resetProviders(BuildContext context) {
    final container = ProviderScope.containerOf(context);
    for (final provider in providers) {
      container.invalidate(provider);
    }
  }

  Future<dynamic> _handleException(
    Future<dynamic> Function() action, [
    void Function(AuthException)? handler,
  ]) async {
    try {
      return await action();
    } on AuthException catch (e) {
      if (handler == null) {
        showSnackBar(
          SnackBarStyle.error,
          e.code == 'network-request-failed' || e.code == 'network_error'
              ? 'Message.NoConnection'.tr()
              : 'Message.ErrorOccuried'.tr(),
        );
      } else {
        handler(e);
      }
    } on Exception {
      showSnackBar(SnackBarStyle.error, 'Message.ErrorOccuried'.tr());
    }
  }
}

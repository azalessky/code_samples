import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

class LocalRepository {
  final FlutterSecureStorage storage;

  const LocalRepository._(this.storage);

  static Future<LocalRepository> getInstance() async {
    return LocalRepository._(
      FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      ),
    );
  }

  Future<void> saveUserData(UserData data) async {
    await storage.write(key: RepositorySettings.localKey, value: jsonEncode(data));
  }

  Future<UserData?> loadUserData() async {
    final data = await storage.read(key: RepositorySettings.localKey);
    return data == null ? null : jsonDecode(data);
  }

  Future<void> deleteUserData() async {
    await storage.delete(key: RepositorySettings.localKey);
  }
}

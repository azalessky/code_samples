import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/services/services.dart';

class LocalStorage {
  final String name;

  const LocalStorage(this.name);

  Future<dynamic> read() async {
    try {
      final file = await _file();
      if (!await file.exists()) return null;

      debugPrint('LocalStorage.read: ${file.path}');

      final text = await file.readAsString();
      return jsonDecode(text);
    } catch (e, st) {
      logError(e, st);
      return null;
    }
  }

  Future<void> write(JsonData data) async {
    try {
      final file = await _file();
      debugPrint('LocalStorage.write: ${file.path}');

      await file.parent.create(recursive: true);
      await file.writeAsString(jsonEncode(data));
    } catch (e, st) {
      logError(e, st);
    }
  }

  Future<void> delete() async {
    try {
      final file = await _file();
      if (!await file.exists()) return;

      debugPrint('LocalStorage.delete: ${file.path}');
      await file.delete();
    } catch (e, st) {
      logError(e, st);
    }
  }

  Future<File> _file() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/${DirectorySettings.cacheFolder}/$name.json');
  }
}

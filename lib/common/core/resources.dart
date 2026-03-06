import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

class Resources {
  final AssetManifest assetManifest;
  final String assetSubjects;
  final String assetLabels;
  final String assetAttendances;

  const Resources._({
    required this.assetManifest,
    required this.assetSubjects,
    required this.assetLabels,
    required this.assetAttendances,
  });

  static Future<Resources> getInstance() async {
    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final subjects = await rootBundle.loadString(ResourceSettings.assetSubjects);
    final labels = await rootBundle.loadString(ResourceSettings.assetLabels);
    final attendances = await rootBundle.loadString(ResourceSettings.assetAttendances);

    return Resources._(
      assetManifest: manifest,
      assetSubjects: subjects,
      assetLabels: labels,
      assetAttendances: attendances,
    );
  }

  List<Subject> getSubjects(String locale) {
    final data = _localizedData(assetSubjects, locale);
    return data.map<Subject>((e) => Subject.empty().copyWith(name: e)).toList();
  }

  List<Label> getLabels(String locale) {
    final data = _localizedData(assetLabels, locale);
    return data
        .map<Label>(
          (e) => Label.empty().copyWith(
            name: e['name'] ?? '',
            color: Color(int.tryParse(e['color'] ?? '') ?? 0),
          ),
        )
        .toList();
  }

  List<String> getAttendances(String locale) {
    final data = _localizedData(assetAttendances, locale);
    return List<String>.from(data);
  }

  List<String> getFonts() {
    final files = _assetFileList(ResourceSettings.assetFonts);
    final names = files.map((path) => _fontNameFromPath(path)).toSet().toList();
    names.sort();
    return names;
  }

  List<String> getBackrounds(Brightness brightness) {
    final folder = path.join(
      ResourceSettings.assetBackgrounds,
      brightness == Brightness.light ? 'light' : 'dark',
    );
    return _assetFileList(folder).sorted();
  }

  dynamic _localizedData(String data, String locale) {
    final json = jsonDecode(data);
    return json[locale] ?? json['en'];
  }

  List<String> _assetFileList(String folder) {
    return assetManifest.listAssets().where((path) => path.startsWith(folder)).toList();
  }

  String _fontNameFromPath(String path) {
    final fileName = path.split('/').last;

    var name = fileName.replaceAll('.ttf', '').split('-').first;
    name = name.replaceAllMapped(
      RegExp(r'([a-z])([A-Z0-9])'),
      (match) => '${match[1]} ${match[2]}',
    );
    return name;
  }
}

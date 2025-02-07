import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:intl/intl.dart';

import 'package:student_planner/repositories/repositories.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/common/common.dart';

part 'subjects.g.dart';

@Riverpod(keepAlive: true)
class Subjects extends _$Subjects with SerializableList<Subject> {
  @override
  List<Subject> build() {
    return cachedRepository.getObjectList<Subject>(this) ?? _defaultValue();
  }

  @override
  String get jsonKey => RepositorySettings.subjectsKey;

  @override
  get deserializer => Subject.fromJson;

  @override
  get sortItems => _sortItems;

  List<String> get names => state.map((e) => e.name).toList();

  void resetSubjects() {
    removeAll();
    addItems(_defaultValue());
  }

  List<Subject> _defaultValue() {
    final data = jsonDecode(resources.assetSubjects);
    final lang = Intl.shortLocale(Intl.getCurrentLocale());

    final subjects = data.containsKey(lang) ? data[lang] : data['en'];
    final items = subjects.map<Subject>((e) => Subject.empty().copyWith(name: e['name'])).toList();

    return items;
  }

  void _sortItems() {
    state.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }
}

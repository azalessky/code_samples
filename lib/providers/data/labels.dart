import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/repositories/repositories.dart';

part 'labels.g.dart';

@Riverpod(keepAlive: true)
class Labels extends _$Labels with ListState<Label>, SaveableList<Label> {
  @override
  ListRepository<Label> get repository => labelsRepository;

  @override
  List<Label> build() {
    subscribe(ref);
    return labelsRepository.state ?? _defaultValue();
  }

  @override
  void invalidate() => ref.invalidateSelf();

  Label? getLabel(String name) {
    return state.firstWhereOrNull((label) => label.name == name);
  }

  List<Label> getLabels(List<String> names) {
    return state.where((label) => names.contains(label.name)).toList();
  }

  void resetLabels() {
    removeAll();
    addItems(_defaultValue());
  }

  List<Label> _defaultValue() {
    final config = ref.read(settingsProvider.select((c) => c.general));
    return resources.getLabels(config.appLanguage);
  }
}

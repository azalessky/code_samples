import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/repositories/repositories.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/common/common.dart';

part 'bells.g.dart';

@Riverpod(keepAlive: true)
class Bells extends _$Bells with SerializableList<Bell> {
  @override
  List<Bell> build() {
    ref.listen(settingsProvider, (_, settings) => setCount(settings.periodCount));
    return cachedRepository.getObjectList<Bell>(this) ?? _defaultValue();
  }

  @override
  String get jsonKey => RepositorySettings.bellsKey;

  @override
  get deserializer => Bell.fromJson;

  void setCount(int count) {
    if (count == state.length) {
      return;
    } else if (count < state.length) {
      state.removeRange(count - 1, state.length - 1);
    } else if (count > state.length) {
      state.addAll(List.generate(count - state.length, (index) => Bell.empty()));
    }
  }

  Duration calcRecess(int index) {
    if (index == state.length - 1) return Duration.zero;
    if (state[index + 1].start.isZero || state[index].end.isZero) return Duration.zero;
    return state[index + 1].start.difference(state[index].end);
  }

  List<Bell> _defaultValue() {
    return List.generate(DefaultSettings.periodCount, (index) => Bell.empty());
  }
}

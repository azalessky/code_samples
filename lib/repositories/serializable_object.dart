import 'package:student_planner/models/models.dart';
import 'package:student_planner/repositories/repositories.dart';

mixin SerializableObject<T extends Serializable> implements SerializableBase<T> {
  T get state;
  set state(T values);

  @override
  dynamic serialize() {
    return state.toJson();
  }

  @override
  void deserialize(dynamic json) {
    state = deserializer(json);
  }
}

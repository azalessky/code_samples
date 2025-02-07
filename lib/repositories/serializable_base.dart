import 'package:student_planner/models/models.dart';

abstract class SerializableBase<T> {
  String get jsonKey;
  T Function(JsonData) get deserializer;

  dynamic serialize();
  void deserialize(dynamic data);
}

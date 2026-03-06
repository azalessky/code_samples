import 'package:student_planner/common/common.dart';
import 'package:student_planner/repositories/repositories.dart';

class ObjectRepository<T> extends BaseRepository<T> {
  ObjectRepository(
    String path,
    T Function(JsonData) fromJson,
  ) : super(
        name: path,
        fromJson: (json) => fromJson(json as JsonData),
        toJson: (value) => (value as dynamic).toJson(),
      );
}

import 'package:student_planner/common/common.dart';
import 'package:student_planner/repositories/repositories.dart';

class ListRepository<T> extends BaseRepository<List<T>> {
  ListRepository(
    String name,
    T Function(JsonData) fromJson,
  ) : super(
        name: name,
        fromJson: (json) => (json['items'] as List).map((e) => fromJson(e as JsonData)).toList(),
        toJson: (value) => {
          'items': value.map((e) => (e as dynamic).toJson()).toList(),
        },
      );
}

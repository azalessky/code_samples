import 'package:student_planner/repositories/repositories.dart';

mixin SaveableBase<T> {
  BaseRepository<T> get repository;

  Future<void> save();
  void invalidate();
}

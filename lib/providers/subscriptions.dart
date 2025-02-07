import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/repositories/repositories.dart';

part 'subscriptions.g.dart';

@Riverpod(keepAlive: true)
class Subscriptions extends _$Subscriptions with SerializableObject<Subscription> {
  @override
  Subscription build() {
    return cachedRepository.getObject<Subscription>(this) ?? Subscription.empty();
  }

  @override
  String get jsonKey => RepositorySettings.subscriptionsKey;

  @override
  get deserializer => Subscription.fromJson;

  set expiration(DateTime value) {
    state = state.copyWith(expiration: value);
  }

  set active(bool value) {
    state = state.copyWith(active: value);
  }

  set recurrent(bool value) {
    state = state.copyWith(recurrent: value);
  }

  set product(String value) {
    state = state.copyWith(product: value);
  }

  set purchase(String value) {
    state = state.copyWith(purchase: value);
  }

  set token(String value) {
    state = state.copyWith(token: value);
  }
}

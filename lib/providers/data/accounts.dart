import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:student_planner/models/models.dart';

part 'accounts.g.dart';

@Riverpod(keepAlive: true)
class Accounts extends _$Accounts {
  final _auth = FirebaseAuth.instance;

  @override
  Account build() {
    final subscription = _auth.idTokenChanges().listen((user) => _updateState(user));
    ref.onDispose(() => subscription.cancel());
    return Account.fromUser(_auth.currentUser);
  }

  void _updateState(User? user) {
    state = Account.fromUser(user);
  }
}

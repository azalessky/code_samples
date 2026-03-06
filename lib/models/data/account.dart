import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
abstract class Account with _$Account {
  const factory Account({
    required String userId,
    required String email,
    required String displayName,
    required String photoUrl,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  factory Account.fromUser(User? user) => Account(
    userId: user?.uid ?? '',
    email: user?.email ?? '',
    displayName: user?.displayName ?? '',
    photoUrl: user?.photoURL ?? '',
  );
}

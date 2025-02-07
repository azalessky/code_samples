import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:student_planner/helpers/crypto_helper.dart';

typedef AuthCredential = ({
  OAuthCredential credential,
  String displayName,
  String photoUrl,
});

class AuthException implements Exception {
  final String? code;
  final String? message;

  const AuthException({this.code, this.message});

  factory AuthException.fromException(Exception e) {
    if (e is FirebaseException) {
      return AuthException(code: e.code, message: e.message);
    } else if (e is PlatformException) {
      return AuthException(code: e.code, message: e.message);
    } else {
      throw AuthException(message: e.toString());
    }
  }

  @override
  String toString() => message ?? 'AuthException';
}

class AuthService {
  final auth = FirebaseAuth.instance;

  bool get isSignedIn => auth.currentUser != null;

  Future<bool> signIn() async {
    return await _handleException(() async {
      final credential = await _getCredential();
      if (credential == null) return false;

      await auth.signInWithCredential(credential.credential);
      final user = auth.currentUser;

      if (credential.displayName.isNotEmpty) {
        await user?.updateDisplayName(credential.displayName);
      }
      if (credential.photoUrl.isNotEmpty) {
        await user?.updatePhotoURL(credential.photoUrl);
      }
      return true;
    });
  }

  Future<void> signOut() async {
    await _handleException(() async {
      await GoogleSignIn().signOut();
      await auth.signOut();
    });
  }

  Future<OAuthCredential?> startDeleteUser() async {
    return await _handleException(() async {
      final user = auth.currentUser;
      if (user == null) return null;

      final credential = await _getCredential();
      return credential?.credential;
    });
  }

  Future<void> completeDeleteUser(OAuthCredential credential) async {
    await _handleException(() async {
      final user = auth.currentUser;
      if (user == null) return;

      await user.reauthenticateWithCredential(credential);
      await user.delete();
      await GoogleSignIn().signOut();
    });
  }

  Future<void> reloadUser() async {
    await _handleException(() async {
      await auth.currentUser?.reload();
    });
  }

  Future<dynamic> _handleException(Future<dynamic> Function() action) async {
    try {
      return await action();
    } on Exception catch (e) {
      throw AuthException.fromException(e);
    }
  }

  Future<AuthCredential?> _getCredential() async {
    return Platform.isAndroid ? _googleCredential() : _appleCredential();
  }

  Future<AuthCredential?> _googleCredential() async {
    final googleSignIn = GoogleSignIn();
    final account = await googleSignIn.signIn();

    if (account == null) return null;
    final auth = await account.authentication;

    return (
      credential: GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      ),
      displayName: account.displayName ?? '',
      photoUrl: account.photoUrl ?? '',
    );
  }

  Future<AuthCredential?> _appleCredential() async {
    final rawNonce = CryptoHelper.generateNonce();
    final nonce = CryptoHelper.sha256Digest(rawNonce);

    try {
      final scopes = [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ];
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: scopes,
        nonce: nonce,
      );

      return (
        credential: OAuthProvider("apple.com").credential(
          idToken: credential.identityToken,
          rawNonce: rawNonce,
          accessToken: credential.authorizationCode,
        ),
        displayName: _displayName(credential.givenName, credential.familyName),
        photoUrl: '',
      );
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) return null;
      rethrow;
    }
  }

  String _displayName(String? firstName, String? lastName) {
    var displayName = firstName ?? '';
    if (lastName?.isNotEmpty == true) {
      if (displayName.isNotEmpty) displayName += ' ';
      displayName += lastName!;
    }
    return displayName;
  }
}

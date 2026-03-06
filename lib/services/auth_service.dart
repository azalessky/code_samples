import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:student_planner/common/common.dart';

typedef AuthCredential = ({
  OAuthCredential credential,
  String displayName,
  String photoUrl,
});

class AuthInfo {
  final String userId;
  final String email;
  final String displayName;
  final String photoUrl;

  AuthInfo({
    required this.userId,
    required this.email,
    required this.displayName,
    required this.photoUrl,
  });

  factory AuthInfo.fromUser(User? user) => AuthInfo(
    userId: user?.uid ?? '',
    email: user?.email ?? '',
    displayName: user?.displayName ?? '',
    photoUrl: user?.photoURL ?? '',
  );
}

class AuthException implements Exception {
  final String? code;
  final String? message;

  const AuthException({this.code, this.message});

  factory AuthException.fromException(Exception e) {
    return switch (e) {
      FirebaseAuthException() => AuthException(code: e.code, message: e.message),
      PlatformException() => AuthException(code: e.code, message: e.message),
      AuthException() => AuthException(code: e.code, message: e.message),
      _ => AuthException(message: e.toString()),
    };
  }

  bool get userNotFound => code == 'user-not-found';
  bool get networkError => code == 'network-request-failed' || code == 'network_error';

  @override
  String toString() => message ?? 'AuthException';
}

class AuthService {
  static final instance = AuthService._();

  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn.instance;

  AuthService._();

  User? get currentUser => _auth.currentUser;
  Stream<User?> get userChanges => _auth.userChanges();

  bool get hasUser => _auth.currentUser != null;
  bool get isAnonymous => _auth.currentUser?.isAnonymous == true;

  static Future<void> initialize() async {
    await instance._googleSignIn.initialize();
  }

  Future<bool> signIn({VoidCallback? onUserChange}) async {
    return _handleException(() async {
      final credential = await _getCredential();
      if (credential == null) return false;

      await _linkOrSignIn(_auth.currentUser, credential.credential, onUserChange);
      await _updateUserInfo(_auth.currentUser, credential);

      return true;
    }, ensureOnline: true);
  }

  Future<bool> signInAnonymously() async {
    return _handleException(() async {
      final credential = await FirebaseAuth.instance.signInAnonymously();
      return credential.user != null;
    }, ensureOnline: true);
  }

  Future<void> signOut() async {
    return _handleException(() async {
      await _googleSignIn.signOut();
      await _auth.signOut();
    });
  }

  Future<OAuthCredential?> startDeleteUser() async {
    return _handleException(() async {
      final credential = await _getCredential();
      return credential?.credential;
    }, ensureOnline: true);
  }

  Future<void> completeDeleteUser(OAuthCredential? credential) async {
    return _handleException(() async {
      if (credential != null) {
        await currentUser?.reauthenticateWithCredential(credential);
      }
      await currentUser?.delete();
      await _auth.signOut();
      await _googleSignIn.signOut();
    }, ensureOnline: true);
  }

  Future<void> reloadUser() async {
    return _handleException(() async {
      await _auth.currentUser?.reload();
    });
  }

  Future<T> _handleException<T>(
    Future<T> Function() action, {
    bool ensureOnline = false,
  }) async {
    try {
      if (ensureOnline) await _checkConnectivity();
      return await action();
    } on Exception catch (e, st) {
      Error.throwWithStackTrace(AuthException.fromException(e), st);
    }
  }

  Future<void> _linkOrSignIn(
    User? user,
    OAuthCredential credential,
    VoidCallback? onUserChange,
  ) async {
    if (user?.isAnonymous != true) {
      await _auth.signInWithCredential(credential);
      return;
    }

    try {
      await user?.linkWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'credential-already-in-use') {
        onUserChange?.call();
        await _auth.signInWithCredential(credential);
      } else {
        rethrow;
      }
    }
  }

  Future<void> _updateUserInfo(User? user, AuthCredential credential) async {
    if (credential.displayName.isNotEmpty) {
      await user?.updateDisplayName(credential.displayName);
    }
    if (credential.photoUrl.isNotEmpty) {
      await user?.updatePhotoURL(credential.photoUrl);
    }
    await user?.reload();
  }

  Future<AuthCredential?> _getCredential() async {
    return Platform.isAndroid ? _googleCredential() : _appleCredential();
  }

  Future<void> _checkConnectivity() async {
    final connected = await Connectivity().checkConnectivity();
    if (connected.contains(ConnectivityResult.none)) {
      throw AuthException(code: 'network_error');
    }
  }

  Future<AuthCredential?> _googleCredential() async {
    try {
      final account = await _googleSignIn.authenticate();
      final auth = account.authentication;

      return (
        credential: GoogleAuthProvider.credential(idToken: auth.idToken),
        displayName: account.displayName ?? '',
        photoUrl: account.photoUrl ?? '',
      );
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) return null;
      rethrow;
    }
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
    return [firstName, lastName].where((name) => name?.isNotEmpty ?? false).join(' ');
  }
}

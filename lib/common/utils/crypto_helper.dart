import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class CryptoHelper {
  static String base64ToPemKey(String base64) {
    final buffer = StringBuffer();
    buffer.writeln('-----BEGIN PRIVATE KEY-----');

    final width = 64;
    for (var i = 0; i < base64.length; i += width) {
      final end = (i + width < base64.length) ? i + width : base64.length;
      buffer.writeln(base64.substring(i, end));
    }

    buffer.writeln('-----END PRIVATE KEY-----');
    return buffer.toString();
  }

  static String generateNonce([int length = 32]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  static String sha256Digest(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}

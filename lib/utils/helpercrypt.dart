import 'dart:convert';
import 'package:encrypt/encrypt.dart';

class EncryptionHelper {
  final Key key;
  final IV iv;
  final Encrypter encrypter;

  EncryptionHelper(String keyString)
      : key = Key.fromUtf8(keyString),
        iv = IV.fromLength(16),
        encrypter = Encrypter(AES(Key.fromUtf8(keyString),mode: AESMode.cbc, padding: "PKCS7"));

  String encrypt(String plainText) {
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }


}

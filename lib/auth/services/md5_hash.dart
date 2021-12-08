import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:router_setting/auth/services/password_hash.dart';

class Md5Hash implements PasswordHash {
  @override
  String hash(String password) {
    return md5.convert(utf8.encode(password)).toString();
  }
}

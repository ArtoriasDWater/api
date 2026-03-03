import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  final _storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async =>
      await _storage.write(key: "jwt", value: token);

  Future<String?> getToken() async => await _storage.read(key: "jwt");

  Future<void> deleteToken() async => await _storage.delete(key: "jwt");
}

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationProvider with ChangeNotifier {
  AuthenticationProvider() {
    init();
  }

  Credentials? _credentials;

  late Auth0 auth0;
  final storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  init() {
    auth0 = Auth0('dev-ew2mgn7vvmi1sfiu.us.auth0.com',
        'VmIxiUJIxWuGQRsPt5AY4HHZJDGxIkYu');
  }

  Future<bool> isAuthenticated() async {
    try {
      final token = await storage.read(key: "access_token");
      if (token == null) return false;
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> login() async {
    try {
      final credentials = await auth0.webAuthentication().login();
      _credentials = credentials;
      await storage.write(
          key: "access_token", value: _credentials!.accessToken);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> logout() async {
    await auth0.webAuthentication().logout();
    await storage.delete(key: "access_token");
  }
}

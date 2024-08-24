import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationDataSource {
  final SharedPreferences _sharedPreferences;

  const AuthenticationDataSource(this._sharedPreferences);

  Future<void> authenticateUser({String? username}) async {
    await _sharedPreferences.setString('username', username!);
  }

  String? getUser() {
    return _sharedPreferences.getString('username');
  }
}

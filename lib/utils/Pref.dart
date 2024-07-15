import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('access_token', token);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('access_token') ?? '';
  }
}

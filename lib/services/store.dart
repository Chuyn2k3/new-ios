import 'package:shared_preferences/shared_preferences.dart';

class Store {
  static const String _tokenKey = "token";
  static Future<void> setToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_tokenKey);
  }
  
}

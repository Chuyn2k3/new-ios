import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Store {
  //const Store._();
  static const String _tokenKey = "946|2c0DQueR2HRzdUmSjwJ0wLjCfIewxFx3ivlfUysQ";
  static Future<void> setToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_tokenKey);
  }
}

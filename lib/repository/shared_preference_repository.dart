import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceRepository {
  static const String KEY_TOKEN = "KEY_TOKEN";
  static const String KEY_USER_NAME = "KEY_USER_NAME";

  static Future<void> setToken(String token) async {
    debugPrint("setToken: $token");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(KEY_TOKEN, token);
  }

  static Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString(KEY_TOKEN) ?? "";
    debugPrint("getToken: $token");
    return token;
  }

  static Future<void> setUserName(String userName) async {
    debugPrint("setUserName: $userName");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(KEY_USER_NAME, userName);
  }

  static Future<String> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userName = preferences.getString(KEY_USER_NAME) ?? "";
    debugPrint("getUserName: $userName");
    return userName;
  }
}

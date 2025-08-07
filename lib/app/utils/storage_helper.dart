import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static Future<void> saveLoginData({
    required String token,
    required String expireAt,
    required Map<String, dynamic> user,
    required String username,
    required String password,
    required String deviceId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('token_expire', expireAt);
    await prefs.setString('username', username);
    await prefs.setString('password', password);
    await prefs.setString('device_id', deviceId);
    await prefs.setString('user', user.toString());
  }

  static Future<Map<String, String?>> getStoredLoginCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'username': prefs.getString('username'),
      'password': prefs.getString('password'),
      'device_id': prefs.getString('device_id'),
    };
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<String?> getTokenExpire() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token_expire');
  }

  static Future<void> clearStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

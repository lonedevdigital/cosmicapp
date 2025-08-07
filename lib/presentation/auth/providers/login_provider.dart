import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:cosmicscans/app/config/api_config.dart';
import 'package:cosmicscans/core/network/api_client.dart';
import 'package:cosmicscans/app/utils/device_utils.dart';
import 'package:cosmicscans/app/utils/storage_helper.dart';

class LoginProvider extends ChangeNotifier {
  final ApiClient _apiClient = ApiClient();

  bool isLoading = false;
  String? errorMessage;
  Map<String, dynamic>? userData;

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    _setLoading(true);

    try {
      final deviceId = await DeviceUtils.getDeviceId();

      final response = await _apiClient.post(
        ApiConfig.loginPath,
        data: {
          'username': username.trim(),
          'password': password,
          'device_id': deviceId,
        },
      );

      final data = response.data;
      if (response.statusCode == 200 && data['success'] == true) {
        final user = data['data']['user'];
        final token = data['data']['access_token'];
        final expireAt = data['data']['access_token_expire'];

        userData = user;

        // Simpan ke local
        await StorageHelper.saveLoginData(
          token: token,
          expireAt: expireAt,
          user: user,
          username: username,
          password: password,
          deviceId: deviceId,
        );

        _setLoading(false);
        return true;
      } else {
        errorMessage = data['message'] ?? 'Login gagal.';
        _setLoading(false);
        return false;
      }
    } on DioException catch (e) {
      final res = e.response;
      errorMessage = res?.data['message'] ?? 'Login gagal.';
    } catch (e) {
      errorMessage = 'Terjadi kesalahan tak terduga.';
    }

    _setLoading(false);
    return false;
  }

  Future<bool> tryAutoLogin() async {
    final token = await StorageHelper.getToken();
    final expire = await StorageHelper.getTokenExpire();

    if (token == null || expire == null) return false;

    final expireDate = DateTime.tryParse(expire);
    final now = DateTime.now();

    if (expireDate == null || now.isAfter(expireDate)) {
      // Token expired, login ulang
      final stored = await StorageHelper.getStoredLoginCredentials();
      final username = stored['username'];
      final password = stored['password'];
      final deviceId = stored['device_id'];

      if (username != null && password != null && deviceId != null) {
        return await login(username: username, password: password);
      }

      return false;
    }

    return true;
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void logout() async {
    await StorageHelper.clearStorage();
    userData = null;
    notifyListeners();
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }
}

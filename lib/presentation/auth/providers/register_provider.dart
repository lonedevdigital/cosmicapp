import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cosmicscans/core/network/api_client.dart';
import 'package:cosmicscans/app/config/api_config.dart';
import 'package:cosmicscans/app/utils/device_utils.dart'; // Tambahan

class RegisterProvider extends ChangeNotifier {
  final ApiClient _apiClient = ApiClient();

  bool isLoading = false;
  String? errorMessage;
  String? successMessage;
  Map<String, dynamic>? userData;

  Future<bool> register({
    required String username,
    required String email,
    required String password,
  }) async {
    _setLoading(true);

    try {
      final deviceId = await DeviceUtils.getDeviceId(); // Dapatkan device ID

      final requestData = {
        'username': username.trim(),
        'email': email.trim().toLowerCase(),
        'password': password,
        'device_id': deviceId, // Sesuai format backend
      };

      final response = await _apiClient.post(
        ApiConfig.registerPath,
        data: requestData,
      );

      final data = response.data;

      if (response.statusCode == 201 && data['success'] == true) {
        successMessage = data['message'] ?? 'Berhasil mendaftar!';
        userData = data['data'];
        _setLoading(false);
        return true;
      } else {
        errorMessage = data['message'] ?? 'Gagal mendaftar.';
        _setLoading(false);
        return false;
      }

    } on DioException catch (e) {
      final res = e.response;
      if (res != null && res.data != null && res.data is Map<String, dynamic>) {
        errorMessage = res.data['message'] ?? 'Gagal mendaftar. Coba lagi.';
        if (res.data['errors'] != null) {
          final errors = res.data['errors'] as Map<String, dynamic>;
          if (errors.isNotEmpty) {
            final firstError = errors.values.first;
            if (firstError is List && firstError.isNotEmpty) {
              errorMessage = firstError[0];
            }
          }
        }
      } else {
        errorMessage = 'Gagal mendaftar. Coba lagi.';
      }
    } catch (e) {
      errorMessage = 'Kesalahan tidak terduga. Coba lagi.';
    }

    _setLoading(false);
    return false;
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }

  void clearSuccess() {
    successMessage = null;
    notifyListeners();
  }

  void reset() {
    isLoading = false;
    errorMessage = null;
    successMessage = null;
    userData = null;
    notifyListeners();
  }

  String? validateInput({
    required String email,
    required String username,
    required String password,
  }) {
    if (email.isEmpty) return 'Email harus diisi';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return 'Email tidak valid';
    }
    if (username.isEmpty) return 'Username harus diisi';
    if (username.length < 3) return 'Minimal 3 karakter';
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(username)) {
      return 'Username hanya huruf, angka, dan _';
    }
    if (password.isEmpty) return 'Password harus diisi';
    if (password.length < 6) return 'Minimal 6 karakter';
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}

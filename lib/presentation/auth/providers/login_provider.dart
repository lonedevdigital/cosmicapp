import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cosmicscans/core/network/api_client.dart';
import 'package:cosmicscans/app/config/api_config.dart';

class LoginProvider extends ChangeNotifier {
  final ApiClient _apiClient = ApiClient();

  bool isLoading = false;
  String? errorMessage;
  String? successMessage;
  Map<String, dynamic>? userData;

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    _setLoading(true);

    try {
      final response = await _apiClient.post(
        ApiConfig.loginPath, // gunakan path relatif
        data: {
          'email': email.trim(),
          'password': password,
        },
      );

      final data = response.data;

      if (response.statusCode == 200 && data['success'] == true) {
        successMessage = data['message'] ?? 'Login berhasil!';
        userData = data['data'];
        _setLoading(false);
        return true;
      } else {
        errorMessage = data['message'] ?? 'Login gagal.';
        _setLoading(false);
        return false;
      }
    } on DioException catch (e) {
      final res = e.response;
      errorMessage = res?.data['message'] ?? 'Gagal login. Silakan coba lagi.';
    } catch (e) {
      errorMessage = 'Terjadi kesalahan tak terduga.';
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
    required String password,
  }) {
    if (email.isEmpty) return 'Email tidak boleh kosong';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return 'Format email tidak valid';
    }
    if (password.isEmpty) return 'Password tidak boleh kosong';
    if (password.length < 6) return 'Password minimal 6 karakter';
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}

import 'package:dio/dio.dart';
import 'package:cosmicscans/app/config/api_config.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
      : _dio = Dio(
    BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': ApiConfig.apiKey, // ✅ GLOBAL AUTH
      },
    ),
  ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('\n================= 🚀 REQUEST =================');
          print('METHOD  : ${options.method}');
          print('URL     : ${options.uri}');
          print('HEADERS : ${options.headers}');
          print('DATA    : ${options.data}');
          print('============================================\n');
          handler.next(options);
        },
        onResponse: (response, handler) {
          print('\n================= ✅ RESPONSE ================');
          print('STATUS  : ${response.statusCode}');
          print('DATA    : ${response.data}');
          print('============================================\n');
          handler.next(response);
        },
        onError: (error, handler) {
          final response = error.response;
          print('\n================= ❌ ERROR ====================');
          print('MESSAGE : ${error.message}');
          print('URL     : ${error.requestOptions.uri}');
          print('STATUS  : ${response?.statusCode}');
          print('DATA    : ${response?.data}');
          print('============================================\n');
          handler.next(error);
        },
      ),
    );
  }

  // Ganti API Key jika diperlukan
  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = token;
  }

  void clearAuthToken() {
    _dio.options.headers.remove('Authorization');
  }

  Map<String, dynamic> getCurrentHeaders() {
    return Map<String, dynamic>.from(_dio.options.headers);
  }

  // Jaga supaya header global tetap ikut
  Options _mergeOptions(Map<String, dynamic>? extraHeaders) {
    final merged = Map<String, dynamic>.from(_dio.options.headers);
    if (extraHeaders != null) merged.addAll(extraHeaders);
    return Options(headers: merged);
  }

  // GET
  Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: _mergeOptions(headers),
      );
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  // POST
  Future<Response> post(
      String path, {
        dynamic data,
        Map<String, dynamic>? headers,
      }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        options: _mergeOptions(headers),
      );
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  // PUT
  Future<Response> put(
      String path, {
        dynamic data,
        Map<String, dynamic>? headers,
      }) async {
    try {
      return await _dio.put(
        path,
        data: data,
        options: _mergeOptions(headers),
      );
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  // DELETE
  Future<Response> delete(
      String path, {
        Map<String, dynamic>? headers,
      }) async {
    try {
      return await _dio.delete(
        path,
        options: _mergeOptions(headers),
      );
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  // Error handler khusus Dio
  void _handleDioError(DioException e) {
    final response = e.response;
    print('\n=============== ⚠️ Dio Error Handler ===============');
    print('URL      : ${e.requestOptions.uri}');
    print('STATUS   : ${response?.statusCode}');
    print('MESSAGE  : ${e.message}');
    print('RESPONSE : ${response?.data}');
    print('====================================================\n');
  }
}

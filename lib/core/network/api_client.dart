import 'package:dio/dio.dart';
import 'package:cosmicscans/app/config/api_config.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  final Dio _dio;

  factory ApiClient() => _instance;

  ApiClient._internal()
      : _dio = Dio(
    BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      headers: {
        'Authorization': ApiConfig.apiKey, // ✅ Cocok dengan backend
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  ) {
    print('✅ ApiClient diinstansiasi');

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('\n🔥 [DIO] FINAL REQUEST:');
          print('URL     : ${options.uri}');
          print('METHOD  : ${options.method}');
          print('HEADERS :');
          options.headers.forEach((k, v) => print('  $k: $v'));
          print('BODY    : ${options.data}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          print('\n✅ [DIO] RESPONSE: ${response.statusCode}');
          handler.next(response);
        },
        onError: (error, handler) {
          print('\n❌ [DIO] ERROR: ${error.message}');
          print('STATUS  : ${error.response?.statusCode}');
          print('RESPONSE: ${error.response?.data}');
          handler.next(error);
        },
      ),
    );
  }

  Future<Response> post(String path, {dynamic data}) =>
      _dio.post(path, data: data);
}

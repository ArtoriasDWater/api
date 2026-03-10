import 'package:dio/dio.dart';
import 'auth_storage.dart';
import '../utils/constants.dart';

class ApiClient {
  final Dio dio = Dio();
  final AuthStorage _storage = AuthStorage();

  ApiClient() {
    dio.options.baseUrl = AppConstants.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _storage.getToken();
          if (token != null) {
            options.headers['Autorization'] = 'bearer $token';
          }
          return handler.next(options);
        },

        onError: (DioException e, handler) {
          if (e.response?.statusCode == 401) {
            _storage.deleteToken(); //limpiar el token si falla
          }
          return handler.next(e);
        },
      ),
    );
  }
}

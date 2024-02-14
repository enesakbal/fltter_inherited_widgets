import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/src/core/app_constants.dart';

class NetworkManager {
  late final Dio _dio;

  NetworkManager() {
    final baseOptions = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      contentType: 'application/json',
      responseType: ResponseType.json,
    );

    _dio = Dio(baseOptions);
  }

  Future<Response> get(String url, {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(
      url,
      queryParameters: queryParameters,
    );
  }
}

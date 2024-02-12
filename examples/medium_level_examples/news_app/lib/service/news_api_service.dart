import 'dart:math';

import 'package:dio/dio.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/models/news_response.dart';

class NewsApiService {
  late final Dio _dio;

  NewsApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: NewsAppConstants.baseUrl,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        headers: {'Content-Type': 'application/json'},
        queryParameters: {'apiKey': NewsAppConstants.apiKey},
      ),
    );
  }

  Future<NewsResponse> getPopularNews() async {
    try {
      final response = await _dio.get(
        NewsAppConstants.everythingEndPoint,
        queryParameters: {
          'sortBy': NewsAppConstants.sortByPopularity,
          'q': 'bitcoin',
          'pageSize': 20,
          'page': Random.secure().nextInt(10),
        },
      );

      if (response.statusCode == 200) {
        return NewsResponse.fromMap(response.data as Map<String, dynamic>);
      } else {
        print(response.data.toString());
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Failed to load news');
    }
  }
}

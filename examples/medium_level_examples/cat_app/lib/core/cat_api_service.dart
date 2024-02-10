import 'dart:convert';

import 'package:cat_app/core/constants.dart';
import 'package:cat_app/model/cat_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CatApiService {
  const CatApiService();

  Future<List<CatModel>> fetchCats() async {
    try {
      final uri = Uri.https(
        CatAppConstants.baseUrl,
        CatAppConstants.searchEndPoint,
        {'limit': CatAppConstants.countPerFetch},
      );

      final response = await http.get(
        uri,
        headers: {
          'x-api-key': CatAppConstants.apiKey,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        final catList = <CatModel>[];

        catList.addAll((json as List<dynamic>).map((e) => CatModel.fromMap(e as Map<String, dynamic>)).toList());
        return catList;
      } else {
        throw Exception('Failed to load cat image');
      }
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception('Failed to load cat image');
    }
  }
}

import 'package:cat_app/core/constants.dart';
import 'package:cat_app/model/cat_model.dart';
import 'package:http/http.dart' as http;

class CatApiService {
  const CatApiService();

  Future<List<CatModel>> fetchCats() async {
    final uri = Uri.https(
      CatAppConstants.baseUrl,
      CatAppConstants.searchEndPoint,
      {'x-api-key': CatAppConstants.apiKey, 'Content-Type': 'application/json'},
    );

    final response = await http.get(
      uri,
      headers: {
        'x-api-key': CatAppConstants.apiKey,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final json = response.body;

      final catList = <CatModel>[];

      catList.add(CatModel.fromJson(json));
      return catList;
    } else {
      throw Exception('Failed to load cat image');
    }
  }
}

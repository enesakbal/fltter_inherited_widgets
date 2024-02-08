import 'package:http/http.dart' as http;

class CatApiService {
  const CatApiService();

  Future<String> getCatImageUrl() async {
    final response = await http.get(Uri.parse('https://api.thecatapi.com/v1/images/search'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load cat image');
    }
  }
}

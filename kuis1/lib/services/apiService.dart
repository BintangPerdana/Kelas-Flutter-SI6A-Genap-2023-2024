import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://newsapi.org/v2";
  static const String apiKey =
      "f68fd7346ac3449b8c9b9870a5767831"; //PAKAI API KEY ANDA

  Future<List<Map<String, dynamic>>> getTopHeadlines() async {
    final response = await http
        .get(Uri.parse("$baseUrl/top-headlines?country=id&apiKey=$apiKey"));
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }
}

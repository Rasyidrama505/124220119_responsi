import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseNetwork {
  static const String baseUrl = 'https://www.amiiboapi.com/api/';

  // Get all data from the API
  static Future<List<dynamic>> getAllAmiiboData() async {
    final url = Uri.parse(baseUrl + 'amiibo');
    print("Fetching all amiibo data from: $url");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data.containsKey('amiibo')) {
          return data['amiibo'] as List<dynamic>;
        } else {
          throw Exception("Unexpected response structure");
        }
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      throw Exception("Error fetching amiibo data: $e");
    }
  }

  // Get specific amiibo data by head
  static Future<Map<String, dynamic>> getAmiiboByHead(String head) async {
    final url = Uri.parse(baseUrl + 'amiibo/?head=$head');
    print("Fetching amiibo by head from: $url");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      throw Exception("Error fetching amiibo detail: $e");
    }
  }
}

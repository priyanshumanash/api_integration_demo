import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiManager {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Method to handle GET requests
  Future<List<dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>; // Convert response to List
    } else {
      throw Exception('Failed to load data');
    }
  }
}


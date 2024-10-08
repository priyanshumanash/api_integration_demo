import 'package:api_integration_demo/services/api_manager.dart';

class Repository {
  final ApiManager _apiManager = ApiManager();

  Future<List<dynamic>> fetchData() async {
    try {
      final data = await _apiManager.get('posts'); // Dummy endpoint for posts
      return data; // Return the list of posts
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}

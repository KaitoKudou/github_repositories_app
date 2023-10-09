import 'package:dio/dio.dart';
import 'package:github_repositories_search_app/model/github_search_response.dart';

class GitHubAPIClient {
  final dio = Dio();

  Future<List<GitHubSearchResponse>> getRepositories(String query) async {
    final response = await dio.get(
      'https://api.github.com/search/repositories',
      queryParameters: {'q': query},
    );

    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      final List<dynamic> items = data['items'];
      return items.map((dynamic item) => GitHubSearchResponse.fromJson(item as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load repos');
    }
  }
}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repositories_search_app/model/github_aip_client.dart';
import 'package:github_repositories_search_app/model/github_search_response.dart';
import 'package:github_repositories_search_app/notifier/search_query_notifier.dart';

final githubAPIClientProvider = Provider<GitHubAPIClient>((ref) => GitHubAPIClient());

final githubRepositoriesProvider = FutureProvider.autoDispose.family<List<GitHubSearchResponse>, String>((ref, query) async {
  final githubAPIClient = ref.watch(githubAPIClientProvider);
  return githubAPIClient.getRepositories(query);
});

final searchQueryProvider = StateNotifierProvider<SearchQueryNotifier, String>((ref) => SearchQueryNotifier());
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repositories_search_app/model/github_search_response.dart';

class RepositoryDetailsPage extends ConsumerWidget {
  final GitHubSearchResponse repository;
  const RepositoryDetailsPage({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リポジトリ詳細'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 32.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(image: NetworkImage(repository.owner.avatarUrl)),
                Text(
                  repository.fullName,
                  style: const TextStyle(
                    fontSize: 32,
                  ),
                ),

                const SizedBox(height: 32.0),

                Container(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        repository.language,
                        style: const TextStyle(
                          fontSize: 16
                        ),
                      ),
                      Text(
                        '${repository.stargazersCount} stars',
                        style: const TextStyle(
                            fontSize: 16
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8.0),

                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${repository.watchersCount} watchers',
                        style: const TextStyle(
                            fontSize: 16
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      Text(
                        '${repository.forksCount} forks',
                        style: const TextStyle(
                            fontSize: 16
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      Text(
                        '${repository.openIssuesCount} open issues',
                        style: const TextStyle(
                            fontSize: 16
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

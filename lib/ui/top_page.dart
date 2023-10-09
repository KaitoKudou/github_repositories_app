import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repositories_search_app/provider/providers.dart';
import 'package:github_repositories_search_app/ui/repository_details_page.dart';

class TopPage extends ConsumerStatefulWidget {
  const TopPage({super.key});

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<TopPage> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onSearchChanged() {
    ref.watch(searchQueryProvider.notifier).updateSearchQuery(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final query = ref.watch(searchQueryProvider);
    final repositories = query.isNotEmpty
        ? ref.watch(githubRepositoriesProvider(query))
        : const AsyncValue.data([]);
    return GestureDetector(
      onTap: () {
        primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Githubリポジトリ検索'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'リポジトリ名やキーワードを入力',
                  icon: const Icon(Icons.search_sharp),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onFieldSubmitted: (_) {
                  onSearchChanged();
                },
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: repositories.when(
                data: (data) {
                  if (data.isEmpty) {
                    return const Text('検索結果は0件です');
                  } else {
                    return ListView.separated(
                      padding: const EdgeInsets.only(left: 16),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // TODO: 詳細画面に遷移
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return RepositoryDetailsPage(repository: data[index]);
                                },
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: ListTile(
                              title: Text(
                                '${data[index].fullName}',
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 8.0,
                        );
                      },
                    );
                  }
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, __) {
                  return query.isNotEmpty
                      ? const Text('エラーが発生しました')
                      : Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPage extends ConsumerStatefulWidget {
  const TopPage({super.key});

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<TopPage> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 16),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // TODO: 詳細画面に遷移
                      print('${index}');
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: ListTile(
                        title: Text(
                          '${index}',
                          style: const TextStyle(
                              fontSize: 24
                          ),
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

              ),
            )
          ],
        ),
      ),
    );
  }
}

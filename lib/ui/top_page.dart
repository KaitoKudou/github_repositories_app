import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPage extends ConsumerStatefulWidget {
  const TopPage({super.key});

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<TopPage> {
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
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'リポジトリ名やキーワードを入力',
                icon: Icon(Icons.search_sharp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

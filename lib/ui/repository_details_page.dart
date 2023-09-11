import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RepositoryDetailsPage extends ConsumerStatefulWidget {
  const RepositoryDetailsPage({super.key});

  @override
  ConsumerState createState() => _RepositoryDetailsPageState();
}

class _RepositoryDetailsPageState extends ConsumerState<RepositoryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リポジトリ詳細'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 32.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(image: NetworkImage('https://avatars.githubusercontent.com/u/10639145?s=200&v=4')),
            Text(
              'apple/swift',
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
                    'Written in C++',
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  Text(
                    '50000 stars',
                    style: TextStyle(
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
                    '0 watchers',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),

                  const SizedBox(height: 8.0),

                  Text(
                    '8000 forks',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),

                  const SizedBox(height: 8.0),

                  Text(
                    '400 open issues',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

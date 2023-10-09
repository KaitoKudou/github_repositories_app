
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchQueryNotifier extends StateNotifier<String> {
  SearchQueryNotifier(): super('');

  void updateSearchQuery(String query) {
    state = query;
  }
}
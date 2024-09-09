import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'news_service.dart';

// Define the state for paginated news
class NewsNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  NewsNotifier() : super([]);

  int _currentPage = 1;
  bool _isFetching = false;

  // Getter to check if the list is empty
  bool get isEmpty => state.isEmpty;

  // Load the first page or load more news
  Future<void> fetchNews() async {
    if (_isFetching) return;

    _isFetching = true;
    try {
      final newArticles = await fetchNewsService(
          _currentPage); // Fetch articles for the current page
      state = [
        ...state,
        ...newArticles
      ]; // Append the new articles to the state
      _currentPage++; // Increment page for next request
    } catch (e) {
      throw Exception('Failed to load more news: $e');
    } finally {
      _isFetching = false;
    }
  }

  void clearNews() {
    state = []; // Clears the current list of news
  }

  final newsNotifierProvider =
      StateNotifierProvider<NewsNotifier, List<Map<String, dynamic>>>(
    (ref) => NewsNotifier(),
  );
}

// Riverpod provider for paginated news
final newsNotifierProvider =
    StateNotifierProvider<NewsNotifier, List<dynamic>>((ref) {
  return NewsNotifier();
});

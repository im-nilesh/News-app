import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'news_service.dart'; // Ensure this file has fetchNewsService function

// Define a FutureProvider for fetching news
final newsProvider =
    FutureProvider.family<List<dynamic>, int>((ref, page) async {
  return await fetchNewsService(page); // Use the correct function name
});

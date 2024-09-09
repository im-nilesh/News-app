import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/themes/theme_notifier.dart';
import 'news_notifier.dart';
import 'news_detail_page.dart'; // Import the detailed news page

class NewsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(newsNotifierProvider);
    final notifier = ref.read(newsNotifierProvider.notifier);

    // Fetch initial news when the page is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (news.isEmpty) {
        notifier.fetchNews();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter News'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              // Toggle theme button
              ref.read(themeNotifierProvider.notifier).toggleTheme();
            },
          )
        ],
      ),
      body: news.isEmpty
          ? Center(child: CircularProgressIndicator()) // Loading state
          : RefreshIndicator(
              onRefresh: () async {
                notifier.clearNews(); // Clear existing news
                await notifier.fetchNews(); // Fetch new news
              },
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                    notifier.fetchNews(); // Load more when reaching the end
                  }
                  return true;
                },
                child: ListView.builder(
                  itemCount:
                      news.length + 1, // Add one for the loading indicator
                  itemBuilder: (context, index) {
                    if (index == news.length) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    var article = news[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailPage(
                              title: article['title'] ?? 'No title',
                              description:
                                  article['description'] ?? 'No description',
                              content:
                                  article['content'] ?? 'No content available',
                              author: article['author'] ?? 'Unknown author',
                            ),
                          ),
                        );
                      },
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article['title'] ?? 'No title',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              SizedBox(height: 8),
                              Text(
                                article['description'] ??
                                    'No description available',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}

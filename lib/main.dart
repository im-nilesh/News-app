import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/api/news_page.dart';
import 'package:news_app/themes/theme.dart';
import 'package:news_app/themes/theme_notifier.dart';
// Import theme notifier

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider); // Watch theme mode

    return MaterialApp(
      title: 'Flutter News',
      theme: AppTheme.lightTheme, // Light theme
      darkTheme: AppTheme.darkTheme, // Dark theme
      themeMode: themeMode, // Apply current theme mode
      home: NewsPage(),
    );
  }
}

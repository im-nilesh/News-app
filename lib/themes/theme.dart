import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blueGrey[100], // Accent color
      scaffoldBackgroundColor: Colors.white, // Light background

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blueGrey[100],
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      textTheme: TextTheme(
        titleLarge: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Colors.black87, fontSize: 14),
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.tealAccent[400]),

      // Add other theme details similar to darkTheme
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey[900], // Dark primary color
      hintColor: Colors.tealAccent[400], // Accent color
      scaffoldBackgroundColor: Colors.black, // Dark background

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      textTheme: TextTheme(
        titleLarge: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
      ),

      // Add other theme details
    );
  }
}

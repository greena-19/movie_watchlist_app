
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MovieWatchlistApp());
}

class MovieWatchlistApp extends StatelessWidget {
  const MovieWatchlistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Watchlist',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,

        brightness: Brightness.dark,

        scaffoldBackgroundColor:
            const Color(0xFF101018),

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.dark,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF101018),
          foregroundColor: Colors.white,
        ),
      ),

      home: const HomeScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_watchlist_app/main.dart';

void main() {
  testWidgets('Movie Watchlist app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const MovieWatchlistApp());

    expect(find.text('Movie Watchlist'), findsOneWidget);
    expect(find.text('Discover Movies'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });
}
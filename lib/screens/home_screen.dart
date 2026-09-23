
import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import 'details_screen.dart';
import 'watchlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<void> openDetails(int index) async {
    final movie = sampleMovies[index];

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(
          movie: movie,
        ),
      ),
    );

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> openWatchlist() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const WatchlistScreen(),
      ),
    );

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101018),

      appBar: AppBar(
        backgroundColor: const Color(0xFF101018),
        elevation: 0,

        title: const Text(
          'Movie Watchlist',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.amber,
            ),
            tooltip: 'View Watchlist',
            onPressed: openWatchlist,
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  'Discover Movies',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  'Explore your favorite movies',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              itemCount: sampleMovies.length,

              itemBuilder: (context, index) {

                final movie = sampleMovies[index];

                return Card(
                  color: const Color(0xFF222230),

                  margin: const EdgeInsets.only(
                    bottom: 16,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(16),
                  ),

                  child: InkWell(
                    borderRadius:
                        BorderRadius.circular(16),

                    onTap: () => openDetails(index),

                    child: Padding(
                      padding: const EdgeInsets.all(12),

                      child: Row(
                        children: [

                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(10),

                            child: Image.asset(
                              movie.posterPath,
                              width: 85,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 16),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [

                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  movie.synopsis,
                                  maxLines: 3,
                                  overflow:
                                      TextOverflow.ellipsis,

                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                if (movie.isWatchlisted)
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.bookmark,
                                        color: Colors.amber,
                                        size: 16,
                                      ),

                                      SizedBox(width: 4),

                                      Text(
                                        'Watchlisted',
                                        style: TextStyle(
                                          color: Colors.amber,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),

                              ],
                            ),
                          ),

                          const Icon(
                            Icons.chevron_right,
                            color: Colors.white54,
                          ),

                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

        ],
      ),

      floatingActionButton:
          FloatingActionButton.extended(
        onPressed: openWatchlist,

        backgroundColor: Colors.amber,

        icon: const Icon(
          Icons.bookmark,
          color: Colors.black,
        ),

        label: const Text(
          'View Watchlist',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
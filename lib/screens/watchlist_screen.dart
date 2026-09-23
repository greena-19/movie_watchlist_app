
import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import '../models/movie.dart';
import 'details_screen.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() =>
      _WatchlistScreenState();
}

class _WatchlistScreenState
    extends State<WatchlistScreen> {

  Future<void> openDetails(Movie movie) async {
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

  @override
  Widget build(BuildContext context) {

    final watchlistedMovies = sampleMovies
        .where((movie) => movie.isWatchlisted)
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF101018),

      appBar: AppBar(
        backgroundColor: const Color(0xFF101018),
        elevation: 0,

        iconTheme: const IconThemeData(
          color: Colors.white,
        ),

        title: const Text(
          'My Watchlist',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: watchlistedMovies.isEmpty

          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),

                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [

                    const Icon(
                      Icons.bookmark_border,
                      color: Colors.amber,
                      size: 80,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Your Watchlist is Empty',

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),

                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Explore movies and add your '
                      'favorites to your watchlist.',

                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),

                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 25),

                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                      ),

                      icon: const Icon(
                        Icons.movie,
                      ),

                      label: const Text(
                        'Explore Movies',
                      ),
                    ),

                  ],
                ),
              ),
            )

          : ListView.builder(
              padding: const EdgeInsets.all(16),

              itemCount: watchlistedMovies.length,

              itemBuilder: (context, index) {

                final movie =
                    watchlistedMovies[index];

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

                    onTap: () => openDetails(movie),

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

                                const SizedBox(height: 12),

                                const Row(
                                  children: [

                                    Icon(
                                      Icons.bookmark,
                                      color: Colors.amber,
                                      size: 16,
                                    ),

                                    SizedBox(width: 5),

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
    );
  }
}
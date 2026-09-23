
import 'package:flutter/material.dart';

import '../models/movie.dart';

class DetailsScreen extends StatefulWidget {
  final Movie movie;

  const DetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  State<DetailsScreen> createState() =>
      _DetailsScreenState();
}

class _DetailsScreenState
    extends State<DetailsScreen> {

  void toggleWatchlist() {
    setState(() {
      widget.movie.isWatchlisted =
          !widget.movie.isWatchlisted;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          widget.movie.isWatchlisted
              ? 'Added to Watchlist'
              : 'Removed from Watchlist',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;

    return Scaffold(
      backgroundColor: const Color(0xFF101018),

      appBar: AppBar(
        backgroundColor: const Color(0xFF101018),
        elevation: 0,

        title: Text(
          movie.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.white,
        ),

        actions: [
          IconButton(
            tooltip: movie.isWatchlisted
                ? 'Remove from Watchlist'
                : 'Add to Watchlist',

            icon: Icon(
              movie.isWatchlisted
                  ? Icons.bookmark
                  : Icons.bookmark_border,

              color: Colors.amber,
            ),

            onPressed: toggleWatchlist,
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Center(
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(16),

                  child: Image.asset(
                    movie.posterPath,
                    height: 350,
                    width: 240,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Text(
                movie.title,

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Cast',

                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              ...movie.cast.map(
                (actor) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),

                  child: Row(
                    children: [

                      const Icon(
                        Icons.person,
                        color: Colors.white70,
                        size: 18,
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: Text(
                          actor,

                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Synopsis',

                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                movie.synopsis,

                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  onPressed: toggleWatchlist,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,

                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),

                  icon: Icon(
                    movie.isWatchlisted
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                  ),

                  label: Text(
                    movie.isWatchlisted
                        ? 'Remove from Watchlist'
                        : 'Add to Watchlist',

                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }
}
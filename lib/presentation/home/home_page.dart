import 'package:flutter/material.dart';
import 'package:flutter_movies/core/repositories/movie_repository.dart';
import 'package:flutter_movies/service_locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final MovieRepository _movieRepository;

  @override
  void initState() {
    _movieRepository = sl<MovieRepository>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final movies = await _movieRepository.fetchMovies();
            print("movies $movies");
            if (movies.results.isNotEmpty) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('First movie: ${movies.results.first.title}')),
                );
              }
            }
          },
          child: const Text('Fetch Movies'),
        ),
      ),
    );
  }
}
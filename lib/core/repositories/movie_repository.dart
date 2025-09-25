import 'package:flutter_movies/core/data/datasources/movie_datasource.dart';
import 'package:flutter_movies/core/data/models/movie.dart';

class MovieRepository {
  final MovieDatasource dataSource;

  const MovieRepository({required this.dataSource});

  Future<Movie> fetchMovies() {
    try {
      return dataSource.getMovies();
    } catch(e) {
      throw Exception('Error fetching movies: $e');
    }
  }
}
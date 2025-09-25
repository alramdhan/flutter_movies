import 'package:flutter_movies/core/data/models/movie.dart';
import 'package:flutter_movies/core/services/api_service.dart';

abstract class MovieDatasource {
  Future<Movie> getMovies();
}

class MovieDatasourceImpl implements MovieDatasource {
  final ApiService? apiService;

  MovieDatasourceImpl(this.apiService);

  @override
  Future<Movie> getMovies() async {
    final response = await apiService?.fetchData('/trending/all/day?language=en-US');
    // Assuming the response is a list of movies in JSON format
    if(response?.statusCode == 200) {
      final Movie result = Movie.fromJson(response?.data);
      return result;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
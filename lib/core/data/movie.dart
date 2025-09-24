class Movie {
  final int page;
  final List<DataResults> results;
  final int totalPages;
  final int totalResults;

  Movie({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults
  });
}

class DataResults {
  final bool adults;
  final String backdropPath;
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String mediaType;
  final String originalLanguage;
  final List<int> genreIds;
  final double pupularity;
  final String releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  DataResults({
    required this.adults,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.originalLanguage,
    required this.genreIds,
    required this.pupularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount
  });
}
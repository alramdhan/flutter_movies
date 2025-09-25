import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie extends Equatable {
  final int page;
  final List<DataResults> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  const Movie({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
  
  @override
  List<Object?> get props => [
    page, results, totalPages, totalResults
  ];
}

@JsonSerializable()
class DataResults extends Equatable {
  final bool adults;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  final int id;
  final String title;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  final String overview;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'media_type')
  final String mediaType;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;
  final double pupularity;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  final bool video;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;

  const DataResults({
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

  factory DataResults.fromJson(Map<String, dynamic> json) => _$DataResultsFromJson(json);
  Map<String, dynamic> toJson() => _$DataResultsToJson(this);

  @override
  List<Object?> get props => [
    adults, backdropPath, id, title, originalTitle, overview, posterPath,
    mediaType, originalLanguage, genreIds, pupularity, releaseDate,
    video, voteAverage, voteCount
  ];
}
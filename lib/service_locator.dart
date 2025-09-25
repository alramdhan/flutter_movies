import 'package:flutter_movies/config/api.dart';
import 'package:flutter_movies/core/data/datasources/movie_datasource.dart';
import 'package:flutter_movies/core/repositories/movie_repository.dart';
import 'package:flutter_movies/core/services/api_service.dart';
import 'package:flutter_movies/utils/app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerLazySingleton(() => AppRouter());
  
  // instance DIO sebagai singleton.
  sl.registerLazySingleton<Dio>(() {
    final Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: AppConfig.apiBaseUrl,
      connectTimeout: AppConfig.apiTimeout,
      receiveTimeout: AppConfig.receiveTimeout,
      headers: {
        'Authorization': 'Bearer ${AppConfig.apiKey}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: false,
      request: true,
      error: true
    ));

    return dio;
  });

  // instance ApiService sebagai singleton.
  sl.registerLazySingleton(() => ApiService(sl()));

  // instance MovieDatasource dan MovieRepository
  sl.registerLazySingleton<MovieDatasource>(() => MovieDatasourceImpl(sl()));
  sl.registerFactory<MovieRepository>(() => MovieRepository(dataSource: sl()));
}
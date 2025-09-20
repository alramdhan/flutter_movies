import 'package:flutter_movies/utils/app_router.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerLazySingleton(() => AppRouter());
}
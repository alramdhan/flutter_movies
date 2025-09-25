class AppConfig {
  static const String apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZjBkMzRlNzkxZjljOWMyOWJlYTUwN2UzMjBiZjA4MSIsIm5iZiI6MTc1ODMzOTcwMy4xMjgsInN1YiI6IjY4Y2UyMjc3ODgzZTU1MTMyMGNlYmIwMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KyBvorRroFo09VaXTRAO45-0b8iXPVfWKR_mDRyoZ0g";
  static const String apiBaseUrl = 'https://api.themoviedb.org/3';
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
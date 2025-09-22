import 'package:flutter/material.dart';
import 'package:flutter_movies/service_locator.dart';
import 'package:flutter_movies/splashscreen.dart';
import 'package:flutter_movies/utils/app_router.dart';
import 'package:flutter_movies/utils/themes/app_theme.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeMode _themeMode = ThemeMode.system;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: sl<AppRouter>().navigatorKey,
      title: 'Flutter Demo',
      themeMode: _themeMode,
      theme: AppTheme.themeLight,
      darkTheme: AppTheme.themeDark,
      home: const SplashScreen(),
    );
  }
}
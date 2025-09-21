import 'package:flutter/material.dart';
import 'package:flutter_movies/service_locator.dart';
import 'package:flutter_movies/splashscreen.dart';
import 'package:flutter_movies/utils/app_color.dart';
import 'package:flutter_movies/utils/app_router.dart';
import 'package:flutter_movies/utils/app_theme.dart';

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: sl<AppRouter>().navigatorKey,
      title: 'Flutter Demo',
      theme: AppTheme.themeLight,
      darkTheme: AppTheme.themeDark,
      home: const SplashScreen(),
    );
  }
}
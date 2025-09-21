import 'package:flutter/material.dart';
import 'package:flutter_movies/utils/app_color.dart';

class AppTheme {
  static final colorScheme = ColorScheme.fromSeed(
    seedColor: AppColor.primary,
  );
  static final ThemeData themeLight = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    colorScheme: colorScheme,
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.light,
    textTheme: const TextTheme().copyWith(
      bodySmall: const TextStyle(color: AppColor.dark)
    ),
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white
      ),
    ),
  );
  static final ThemeData themeDark = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    colorScheme: colorScheme,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.dark,
    textTheme: const TextTheme().copyWith(
      bodySmall: const TextStyle(color: Colors.white)
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white
      ),
    ),
  );
}